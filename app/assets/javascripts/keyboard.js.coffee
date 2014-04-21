@keyboard =
  setupKeyboard: ->
    $(document).on 'keyup', (e) ->
      LEFT = 37
      RIGHT = 39
      E = 69
      R = 82
      P = 80
      ESC = 27

      code = e.keyCode
      new_location = undefined
      if LEFT == code
        new_location = $('.action:contains("Prev")').attr 'href'
      else if RIGHT == code
        new_location = $('.action:contains("Next")').attr 'href'
      else if E == code
        new_location = $('.action:contains("Edit")').attr 'href'
      else if R == code
        if self.location.hash == '#raw'
          new_location = '#'
        else
          new_location = '#raw'
      else if P == code
        new_location = $('.action:contains("PDF")').attr 'href'
      else if ESC == code
        new_location = $('.action:contains("Back")').attr 'href'

      if new_location
        self.location = new_location
        false
      else
        true

