return {
  name = '>> Copilot Chat <<',
  key = 'C',
  keymaps = {
    {
      'd',
      function()
        require('avante.api').ask({ question = '#document' })
      end,
      'Document',
    },
    {
      'e',
      function()
        require('avante.api').ask({ question = '#explain' })
      end,
      'Explain',
    },
    {
      'f',
      function()
        require('avante.api').ask({ question = '#fix' })
      end,
      'Fix',
    },
    {
      'o',
      function()
        require('avante.api').ask({ question = '#optimize' })
      end,
      'Optimize',
    },
    {
      'r',
      function()
        require('avante.api').ask({ question = '#review' })
      end,
      'Review',
    },
    {
      't',
      function()
        require('avante.api').ask({ question = '#tests' })
      end,
      'Test',
    },
  },
}
