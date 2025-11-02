(define (problem meetingplanningexample1-problem)
  (:domain meetingplanningexample1)

  (:objects
    richmond_district financial_district - location

    betty alice ben cara
    chloe david ethan farah greg helen ian jack kim leo maya noah
    olivia peter queenie rachel sam tina ursula victor wendy xavier yasmine zane
    andy bella carl diana - person

    t0900 t0915 t0930 t0945
    t1010 t1025 t1040 t1055 t1110 t1125 t1140 t1155
    t1210 t1225 t1240 t1255 t1310 t1325 t1340 t1355
    t1410 t1425 t1440 t1455 t1510 t1525 t1540 t1555
    t1610 t1625 t1640 t1655 t1710 t1715 t1815 - time
  )

  (:init
    ; initial state
    (now t0900)
    (at richmond_district)

    ; directed travel edges
    (edge richmond_district financial_district)
    (edge financial_district richmond_district)

    ; successor used for a single 5-minute wait before Betty
    (succ t1710 t1715)

    ; duration relations used by the plan
    ; travel (rounded up to 25 minutes = 5 ticks)
    (dur5 t0945 t1010)

    ; 15-minute chunks for all meetings
    (dur3 t0900 t0915)
    (dur3 t0915 t0930)
    (dur3 t0930 t0945)

    (dur3 t1010 t1025)
    (dur3 t1025 t1040)
    (dur3 t1040 t1055)
    (dur3 t1055 t1110)
    (dur3 t1110 t1125)
    (dur3 t1125 t1140)
    (dur3 t1140 t1155)
    (dur3 t1155 t1210)
    (dur3 t1210 t1225)
    (dur3 t1225 t1240)
    (dur3 t1240 t1255)
    (dur3 t1255 t1310)
    (dur3 t1310 t1325)
    (dur3 t1325 t1340)
    (dur3 t1340 t1355)
    (dur3 t1355 t1410)
    (dur3 t1410 t1425)
    (dur3 t1425 t1440)
    (dur3 t1440 t1455)
    (dur3 t1455 t1510)
    (dur3 t1510 t1525)
    (dur3 t1525 t1540)
    (dur3 t1540 t1555)
    (dur3 t1555 t1610)
    (dur3 t1610 t1625)
    (dur3 t1625 t1640)
    (dur3 t1640 t1655)
    (dur3 t1655 t1710)

    ; 60-minute block for Betty
    (dur12 t1715 t1815)

    ; availability windows encoded as allowed 15-minute slots (others) and a 60-minute slot (Betty)
    ; Richmond District friends
    (avail15 alice richmond_district t0900 t0915)
    (avail15 ben   richmond_district t0915 t0930)
    (avail15 cara  richmond_district t0930 t0945)

    ; Move to Financial District then meet FD friends
    (avail15 chloe   financial_district t1010 t1025)
    (avail15 david   financial_district t1025 t1040)
    (avail15 ethan   financial_district t1040 t1055)
    (avail15 farah   financial_district t1055 t1110)
    (avail15 greg    financial_district t1110 t1125)
    (avail15 helen   financial_district t1125 t1140)
    (avail15 ian     financial_district t1140 t1155)
    (avail15 jack    financial_district t1155 t1210)
    (avail15 kim     financial_district t1210 t1225)
    (avail15 leo     financial_district t1225 t1240)
    (avail15 maya    financial_district t1240 t1255)
    (avail15 noah    financial_district t1255 t1310)
    (avail15 olivia  financial_district t1310 t1325)
    (avail15 peter   financial_district t1325 t1340)
    (avail15 queenie financial_district t1340 t1355)
    (avail15 rachel  financial_district t1355 t1410)
    (avail15 sam     financial_district t1410 t1425)
    (avail15 tina    financial_district t1425 t1440)
    (avail15 ursula  financial_district t1440 t1455)
    (avail15 victor  financial_district t1455 t1510)
    (avail15 wendy   financial_district t1510 t1525)
    (avail15 xavier  financial_district t1525 t1540)
    (avail15 yasmine financial_district t1540 t1555)
    (avail15 zane    financial_district t1555 t1610)
    (avail15 andy    financial_district t1610 t1625)
    (avail15 bella   financial_district t1625 t1640)
    (avail15 carl    financial_district t1640 t1655)
    (avail15 diana   financial_district t1655 t1710)

    ; Betty's 60-minute meeting slot within her 17:15–21:45 availability
    (avail60_betty t1715 t1815)
  )

  (:goal
    (and
      (met betty)
      (met alice)
      (met ben)
      (met cara)
      (met chloe)
      (met david)
      (met ethan)
      (met farah)
      (met greg)
      (met helen)
      (met ian)
      (met jack)
      (met kim)
      (met leo)
      (met maya)
      (met noah)
      (met olivia)
      (met peter)
      (met queenie)
      (met rachel)
      (met sam)
      (met tina)
      (met ursula)
      (met victor)
      (met wendy)
      (met xavier)
      (met yasmine)
      (met zane)
      (met andy)
      (met bella)
      (met carl)
      (met diana)
    )
  )
)