LEFT = 37
RIGHT = 39
E = 69
R = 82
P = 80
ESC = 27

@keyboard =
  init: =>
    locations = {}

    locations[LEFT] = => @keyboard.getHrefOf 'Prev'
    locations[RIGHT] = => @keyboard.getHrefOf 'Next'
    locations[E] = => @keyboard.getHrefOf 'Edit'
    locations[P] = => @keyboard.getHrefOf 'PDF'
    locations[ESC] = => @keyboard.getHrefOf 'Back'

    locations[R] = =>
      if self.location.hash == '#raw'
        '#'
      else
        '#raw'

    @keyboard.locations = locations

  getHrefOf: (link_text) =>
    $(".action:contains(\"#{link_text}\")").attr 'href'

  setupKeyboard: =>
    do @keyboard.init
    $(document).on 'keyup', (e) =>
      new_location = undefined
      if @keyboard.locations[e.keyCode]
        new_location = do @keyboard.locations[e.keyCode]

      if new_location
        self.location = new_location
        false
      else
        true

