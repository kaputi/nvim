local explain = {
  systemPrompt = [[
You are a programming instructor focused on clear, practical explanations.

When explaining code:
- Provide concise high-level overview first
- Highlight non-obvious implementation details
- Identify patterns and programming principles
- Address any existing diagnostics or warnings
- Focus on complex parts rather than basic syntax
- Use short paragraphs with clear structure
- Mention performance considerations where relevant
]],
  prompt = 'Write an explanation for the selected code as paragraphs of text.',
}

local review = {
  systemPrompt = [[
You are a code reviewer focused on improving code quality and maintainability.

Format each issue you find precisely as:
line=<line_number>: <issue_description>
OR
line=<start_line>-<end_line>: <issue_description>

Check for:
- Unclear or non-conventional naming
- Comment quality (missing or unnecessary)
- Complex expressions needing simplification
- Deep nesting or complex control flow
- Inconsistent style or formatting
- Code duplication or redundancy
- Potential performance issues
- Error handling gaps
- Security concerns
- Breaking of SOLID principles

Multiple issues on one line should be separated by semicolons.
End with: "**`To clear buffer highlights, please ask a different question.`**"

If no issues found, confirm the code is well-written and explain why.
]],
  prompt = 'Review the selected code.',
}

local fix = {
  prompt = 'There is a problem in this code. Identify the issues and rewrite the code with fixes. Explain what was wrong and how your changes address the problems.',
}

local optimize = {
  prompt = 'Optimize the selected code to improve performance and readability. Explain your optimization strategy and the benefits of your changes.',
}

local docs = {
  prompt = 'Please add documentation comments to the selected code.',
}

local tests = {
  prompt = 'Please generate tests for my code.',
}

local getPrompt = function(command)
  local cmd
  if command == 'docs' then
    cmd = docs
  elseif command == 'explain' then
    cmd = explain
  elseif command == 'fix' then
    cmd = fix
  elseif command == 'optimize' then
    cmd = optimize
  elseif command == 'review' then
    cmd = review
  elseif command == 'tests' then
    cmd = tests
  else
    return ''
  end

  local systemPrompt = cmd.systemPrompt or ''

  return systemPrompt .. '\n' .. cmd.prompt
end

return {
  name = '>> Copilot Chat <<',
  key = 'C',
  keymaps = {
    {
      'd',
      function()
        require('avante.api').ask({ question = getPrompt('docs') })
      end,
      'Document',
    },
    {
      'e',
      function()
        require('avante.api').ask({ question = getPrompt('explain') })
      end,
      'Explain',
    },
    {
      'f',
      function()
        require('avante.api').ask({ question = getPrompt('fix') })
      end,
      'Fix',
    },
    {
      'o',
      function()
        require('avante.api').ask({ question = getPrompt('optimize') })
      end,
      'Optimize',
    },
    {
      'r',
      function()
        require('avante.api').ask({ question = getPrompt('review') })
      end,
      'Review',
    },
    {
      't',
      function()
        require('avante.api').ask({ question = getPrompt('tests') })
      end,
      'Test',
    },
  },
}
