class InfoSnowXmlParser

  URL = "http://www.infosnow.ch/~apgmontagne/?type=xml&id=148&report=574&ref=214dbebf85d0fcf9c818fd5d420b2c6f"

  TYPES = [[1, "Pony lift"], [2, "Ski lift"], [3, "Chairlift - 1 person"], [4, "Chairlift - 2 persons"], [5, "Chairlift - 3 persons"], [6, "Chairlift - 4 persons"], [7, "Chairlift - 6 persons"], [8, "Aerial tramway"], [9, "Cable car"], [10, "Aerial cableway"], [11, "Sledge run"], [12, "Hiking Trail"], [13, "Slope - blue"], [14, "Slope - red"], [15, "Slope - black"], [16, "Slope - yellow"], [17, "Slope - blue / red"], [18, "Slope - red / black"], [19, "Snowpark"], [20, "Moguls slope"], [21, "Halfpipe"], [22, "Cross-country - classic & Skating"], [23, "Highspeed slope"], [24, "Kids park"], [25, "Toboganning"], [26, "Snowshoeing"], [27, "Restaurant"], [28, "Cross-country - skating"], [29, "Cross-country - classic"], [30, "Slope - orange"], [31, "Miscellaneous"], [32, "Airboard"], [33, "Bar"], [34, "Bus"], [35, "Curling"], [36, "Ice rink"], [37, "Ice stick shooting"], [38, "Fishing"], [39, "Funispace"], [40, "Golf"], [41, "Group orbit lift"], [42, "Indoor skating"], [43, "Hotel"], [44, "Igloo"], [45, "Fixed rope route"], [46, "Museum"], [47, "Parking"], [48, "Aerial cableway"], [49, "Sauna"], [50, "Shipping"], [51, "Inclined lift"], [52, "Swimming"], [53, "Playground"], [54, "Tennis"], [55, "Chairlift - 8 persons"], [57, "Rack railway"], [58, "Magic carpet"], [59, "Glacial grotto"], [60, "Mountainbike"], [61, "Nordic walking"], [62, "Snowtube"], [63, "Connection slope"], [64, "Night skiing"], [65, "Babylift"], [66, "Sports center"], [67, "Minigolf"], [68, "Downhill slope"], [73, "Boardercross"], [75, "Skicross"], [76, "Slope - black / blue"], [77, "Cross-country with dogs - skating"], [78, "Cross-country with dogs - classic"], [100, "Cross-country with dogs - classic & skating"], [110, "Paragliding"], [111, "Rope park"], [112, "Service center"], [113, "Ski school"], [114, "Bouncy castle"], [115, "Airbag"], [116, "Cabin SAC"], [117, "Snowbus"], [118, "Dog sledge"], [119, "Viewpoint"], [120, "Scooter"], [121, "E-Bike"], [122, "Combined railway"], [129, "Indoor swimming pool"], [130, "Curling hall"], [134, "Infopoint"], [136, "Tennis hall"], [139, "Lake"], [140, "Waterfall"], [143, "Ski jumping"], [145, "Fireplace"], [153, "Avalanche training center"], [155, "Herb garden"], [158, "Vita-Parcours"], [159, "Passenger lift"], [160, "Picnique"], [161, "Fondue"], [162, "Funslope"], [164, "Fitness center"], [165, "Multi-storey car park"], [166, "SOS/First aid"], [167, "Resort connection"], [173, "Leisure train"], [174, "Small animals park"], [175, "Animals park"], [176, "Lucky Luke"], [177, "Library"], [178, "Church / Chappel"], [179, "Private bus"], [180, "Medical practice"], [181, "Bike"], [182, "Mountain hike"], [183, "Alpine hike"], [184, "Scooter rental"], [185, "Dormitory"], [186, "Castle"], [187, "Monument"], [188, "GoKart"], [189, "Airport"], [190, "Airfield"], [191, "Helicopter"], [192, "Ticket machine"], [193, "Rail"], [197, "Picnique"], [199, "Canyoning"], [200, "Hotel-Restaurant"], [201, "Holiday village"], [202, "Saffron nature trail"], [204, "Pension"], [205, "Bar / Restaurant"], [206, "Tunnel"], [207, "Photo booth"], [208, "Snowpark line"], [209, "Kiosk"], [210, "Kite surfing"], [211, "Winterchallenge"], [213, "Local bus"], [214, "Sleigh rental"], [215, "Ice climbing"], [216, "Touring skis"], [218, "Singletrail"], [219, "Defibrillator"], [229, "Piano"], [232, "Fatbike"], [233, "Planetarium"], [235, "Hospital"], [237, "Surfing"], [238, "Standup paddle"], [239, "Bear"], [240, "Groundhog"], [241, "Model flight"], [243, "Alpine dairy"], [244, "Rectory"], [245, "Suspension bridge"], [246, "Wellness"], [247, "Campsite"], [248, "Wildlife observation"], [249, "Shop"], [253, "Pump track"], [254, "Skill center"], [255, "Construction site"], [256, "Trailrunning"], [257, "Fruttli"], [258, "Crag"], [259, "Edelweiss"], [260, "Witch"], [261, "Witch's house"], [262, "Relaxpark"], [263, "Ticket counter"], [264, "Racewalking"], [265, "Winery tasting"], [266, "Zip-Line"], [267, "Football ground"], [268, "Toilet"], [269, "E-Car charging"], [270, "Cinema"], [271, "Tower"], [272, "Carousel"], [275, "Witch forest"], [276, "Foxtrail"], [277, "Bouldern"], [278, "Ping Pong"], [279, "Sculpture"], [280, "Street"]].to_h

  STATE_TYPE_1 = { 0 => { de: 'no Info', fr: '', it: '', en: '' },
                   1 => { de: 'offen', fr: 'ouvert', it: 'aperto', en: 'open' },
                   2 => { de: 'in Vorbereitung', fr: 'en préparation', it: 'in preparazione', en: 'in preparation' },
                   3 => { de: 'geschlossen techn.', fr: 'fermé techn.', it: 'chiuso/a per motivi tecnici', en: 'closed for technical reasons' },
                   5 => { de: 'geschlossen betrieblich', fr: 'fermé exploit.', it: 'chiuso/a per motivi di servizio', en: 'closed for operation' },
                   6 => { de: 'geschlossen atmosphärisch', fr: 'fermé atmosph.', it: 'chiuso/a per motivi atmosferici', en: 'closed due tu atmosphere' },
                   7 => { de: 'ausser Betrieb', fr: 'hors service', it: 'fuori servizio', en: 'Out of service' },
                   16 => { de: 'geschlossen', fr: 'fermé', it: 'chiuso', en: 'closed' }
  }

  STATE_TYPE_2 = { 0 => { de: 'no Info', fr: '', it: '', en: '' },
                   8 => { de: 'offen', fr: 'ouverte', it: 'aperto', en: 'open' },
                   9 => { de: 'in Vorbereitung', fr: 'en préparation', it: 'in preparazione', en: 'in preparation' },
                   10 => { de: 'geschlossen Lawinengefahr', fr: 'fermée risque d\' avalanche', it: 'chiuso pericolo valanghe', en: 'closed danger of avalanches' },
                   11 => { de: 'geschlossen Eis/Hart', fr: 'fermée verglacé', it: 'chiuso per ghiaccio', en: 'closed danger of ice/hard' },
                   12 => { de: 'geschlossen Wind/Kälte', fr: 'fermée vent/froid', it: 'chiuso per vento forte/freddo', en: 'closed danger of wind/cold' },
                   13 => { de: 'geschlossen Sturm/Sicht', fr: 'fermée tempete/visibilité', it: 'chiuso per bufera/mancanza di visibilità', en: 'closed danger of storm' },
                   14 => { de: 'ausser Betrieb', fr: 'hors service', it: 'fuori servizio', en: 'Out of service' },
                   15 => { de: 'geschlossen', fr: 'fermée', it: 'chiuso', en: 'closed' }
  }

  STATE_TYPE_3 = { 0 => { de: 'no Info', fr: '', it: '', en: '' },
                   8 => { de: 'offen', fr: 'ouvert', it: 'aperto', en: 'open' },
                   17 => { de: 'Heute Ruhetag', fr: '', it: '', en: '' },
                   18 => { de: 'Betriebsferien', fr: '', it: '', en: '' },
                   7 => { de: 'ausser Betrieb', fr: 'hors service', it: 'fuori servizio', en: 'Out of service' },
                   16 => { de: 'geschlossen', fr: 'fermé', it: 'chiuso', en: 'closed' }
  }

  STATE_TYPE_4 = { 0 => { de: 'no Info', fr: '', it: '', en: '' },
                   8 => { de: 'offen', fr: 'ouvert', it: 'aperto', en: 'open' },
                   18 => { de: 'Betriebsferien', fr: '', it: '', en: '' },
                   7 => { de: 'ausser Betrieb', fr: 'hors service', it: 'fuori servizio', en: 'Out of service' },
                   16 => { de: 'geschlossen', fr: 'fermé', it: 'chiuso', en: 'closed' }
  }

  STATE_TYPE_5 = { 0 => { de: 'no Info', fr: '', it: '', en: '' },
                   1 => { de: '1 gering', fr: '1 faible', it: '1 debole', en: '1 low' },
                   2 => { de: '2 mässig', fr: '2 limité', it: '2 moderato', en: '2 moderate' },
                   3 => { de: '3 erheblich', fr: '3 marqué', it: '3 marcato', en: '3 considerable' },
                   4 => { de: '4 gross', fr: '4 fort', it: '4 forte', en: '4 high' },
                   5 => { de: '5 sehr gross', fr: '5 très fort', it: '5 molte forte', en: '5 very high' }
  }

  STATE_TYPE_6 = { 0 => { de: 'ausser Betrieb', fr: 'hors service', it: 'fuori servizio', en: 'Out of service' },
                   1 => { de: 'geschlossen', fr: 'fermé', it: 'chiuso', en: 'closed' },
                   2 => { de: 'besetzt', fr: 'occupé', it: 'occupato', en: 'occupied' },
                   3 => { de: 'frei', fr: 'disponible', it: 'disponibile', en: 'vacancy' }
  }

  STATE_TYPE_7 = { 1 => { de: 'keine Info', fr: 'pas d\'info', it: 'senza info', en: 'no info' },
                   2 => { de: 'normal befahrbar', fr: 'praticable normalement', it: 'praticabile normalmente', en: 'normal' },
                   3 => { de: 'salznass', fr: 'salée', it: 'neve fradicia', en: 'salted' },
                   4 => { de: 'teilweise schneebedeckt', fr: 'partiellement enneigée', it: 'in parte innevato/a', en: 'partial snow cover' },
                   5 => { de: 'schneebedeckt', fr: 'couverte de neige', it: 'innevato/a', en: 'total snow cover' },
                   6 => { de: 'Schneeketten obligatorisch', fr: 'chaines à neige obligatoires', it: 'catene obbligatorie', en: 'chains compulsory' },
                   7 => { de: 'geschlossen', fr: 'fermé', it: 'chiuso', en: 'closed' },
                   8 => { de: 'eingeschränkt befahrbar', fr: '', it: '', en: '' }
  }

  STATES = {
      'ANLAGE' => STATE_TYPE_1,
      'SKIPISTE' => STATE_TYPE_2,
      'VERBINDUNG' => STATE_TYPE_1,
      'SCHLITTELWEG' => STATE_TYPE_2,
      'WANDERWEG' => STATE_TYPE_2,
      'PARK' => STATE_TYPE_2,
      'LOIPE' => STATE_TYPE_2,
      'RESTAURANT' => STATE_TYPE_3,
      'UNTERKUNFT' => STATE_TYPE_4,
      'DIVERSES' => STATE_TYPE_1,
      'GEFAHR' => STATE_TYPE_5,
      'PLS' => STATE_TYPE_6,
      'STRASSENZUSTAND' => STATE_TYPE_7
  }


  def initialize
    @input_hash = Hash.from_xml(URI.open(URL))
    @input_hash = @input_hash["Import"]
    @destination = @input_hash["Destination"]
    @date = @input_hash["Date"]
    @resort = @input_hash["Resort"]
    @element_groups = @resort.delete("ElementGroup")
  end

  def response
    { resort: @resort, elements: @element_groups, types: TYPES, states: STATES }
  end
end