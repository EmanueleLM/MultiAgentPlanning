(define (problem schedule-monday-09-17)
  (:domain multiagent-scheduling)

  (:objects
    slot0 slot1 slot2 slot3 slot4 slot5 slot6 slot7 slot8 slot9 slot10 slot11 slot12 slot13 slot14 slot15 - slot

    donald_09 donald_0930 donald_10 donald_14 - aslot
    zach_slot1000 zach_morning zach_1430 - aslot
    kath_ten kath_0930 kath_afternoon - aslot
    deb_10am deb_morning - aslot
    teresa_10am teresa_other - aslot
    james10 james_block - aslot
  )

  (:init
    (owner donald_09 donald)
    (maps donald_09 slot0)
    (available donald_09)

    (owner donald_0930 donald)
    (maps donald_0930 slot1)

    (owner donald_10 donald)
    (maps donald_10 slot2)
    (available donald_10)

    (owner donald_14 donald)
    (maps donald_14 slot10)
    (available donald_14)

    (owner zach_slot1000 zachary)
    (maps zach_slot1000 slot2)
    (available zach_slot1000)

    (owner zach_morning zachary)
    (maps zach_morning slot1)

    (owner zach_1430 zachary)
    (maps zach_1430 slot11)

    (owner kath_ten kathryn)
    (maps kath_ten slot2)
    (available kath_ten)

    (owner kath_0930 kathryn)
    (maps kath_0930 slot1)
    (available kath_0930)

    (owner kath_afternoon kathryn)
    (maps kath_afternoon slot10)

    (owner deb_10am deborah)
    (maps deb_10am slot2)
    (available deb_10am)

    (owner deb_morning deborah)
    (maps deb_morning slot0)

    (owner teresa_10am teresa)
    (maps teresa_10am slot2)
    (available teresa_10am)

    (owner teresa_other teresa)
    (maps teresa_other slot9)

    (owner james10 james)
    (maps james10 slot2)
    (available james10)

    (owner james_block james)
    (maps james_block slot7)
  )

  (:goal (meeting-time slot2))
)