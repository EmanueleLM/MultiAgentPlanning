(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions :action-costs :equality)
  (:types person slot)
  (:predicates
    (person ?p)
    (slot ?s)
    (unavailable ?p ?s)
    (scheduled)
    (scheduled-at ?s)
  )
  (:functions (total-cost))
  (:action schedule-slot1
    :parameters ()
    :precondition (and
      (not (scheduled))
      (not (unavailable Marie slot1))
      (not (unavailable Janice slot1))
      (not (unavailable Elijah slot1))
      (not (unavailable Theresa slot1))
    )
    :effect (and
      (scheduled)
      (scheduled-at slot1)
    )
    :costs 1
  )
  (:action schedule-slot2
    :parameters ()
    :precondition (and
      (not (scheduled))
      (not (unavailable Marie slot2))
      (not (unavailable Janice slot2))
      (not (unavailable Elijah slot2))
      (not (unavailable Theresa slot2))
    )
    :effect (and
      (scheduled)
      (scheduled-at slot2)
    )
    :costs 2
  )
  (:action schedule-slot3
    :parameters ()
    :precondition (and
      (not (scheduled))
      (not (unavailable Marie slot3))
      (not (unavailable Janice slot3))
      (not (unavailable Elijah slot3))
      (not (unavailable Theresa slot3))
    )
    :effect (and
      (scheduled)
      (scheduled-at slot3)
    )
    :costs 3
  )
  (:action schedule-slot4
    :parameters ()
    :precondition (and
      (not (scheduled))
      (not (unavailable Marie slot4))
      (not (unavailable Janice slot4))
      (not (unavailable Elijah slot4))
      (not (unavailable Theresa slot4))
    )
    :effect (and
      (scheduled)
      (scheduled-at slot4)
    )
    :costs 4
  )
  (:action schedule-slot5
    :parameters ()
    :precondition (and
      (not (scheduled))
      (not (unavailable Marie slot5))
      (not (unavailable Janice slot5))
      (not (unavailable Elijah slot5))
      (not (unavailable Theresa slot5))
    )
    :effect (and
      (scheduled)
      (scheduled-at slot5)
    )
    :costs 5
  )
  (:action schedule-slot6
    :parameters ()
    :precondition (and
      (not (scheduled))
      (not (unavailable Marie slot6))
      (not (unavailable Janice slot6))
      (not (unavailable Elijah slot6))
      (not (unavailable Theresa slot6))
    )
    :effect (and
      (scheduled)
      (scheduled-at slot6)
    )
    :costs 6
  )
  (:action schedule-slot7
    :parameters ()
    :precondition (and
      (not (scheduled))
      (not (unavailable Marie slot7))
      (not (unavailable Janice slot7))
      (not (unavailable Elijah slot7))
      (not (unavailable Theresa slot7))
    )
    :effect (and
      (scheduled)
      (scheduled-at slot7)
    )
    :costs 7
  )
  (:action schedule-slot8
    :parameters ()
    :precondition (and
      (not (scheduled))
      (not (unavailable Marie slot8))
      (not (unavailable Janice slot8))
      (not (unavailable Elijah slot8))
      (not (unavailable Theresa slot8))
    )
    :effect (and
      (scheduled)
      (scheduled-at slot8)
    )
    :costs 8
  )
  (:action schedule-slot9
    :parameters ()
    :precondition (and
      (not (scheduled))
      (not (unavailable Marie slot9))
      (not (unavailable Janice slot9))
      (not (unavailable Elijah slot9))
      (not (unavailable Theresa slot9))
    )
    :effect (and
      (scheduled)
      (scheduled-at slot9)
    )
    :costs 9
  )
  (:action schedule-slot10
    :parameters ()
    :precondition (and
      (not (scheduled))
      (not (unavailable Marie slot10))
      (not (unavailable Janice slot10))
      (not (unavailable Elijah slot10))
      (not (unavailable Theresa slot10))
    )
    :effect (and
      (scheduled)
      (scheduled-at slot10)
    )
    :costs 10
  )
  (:action schedule-slot11
    :parameters ()
    :precondition (and
      (not (scheduled))
      (not (unavailable Marie slot11))
      (not (unavailable Janice slot11))
      (not (unavailable Elijah slot11))
      (not (unavailable Theresa slot11))
    )
    :effect (and
      (scheduled)
      (scheduled-at slot11)
    )
    :costs 11
  )
  (:action schedule-slot12
    :parameters ()
    :precondition (and
      (not (scheduled))
      (not (unavailable Marie slot12))
      (not (unavailable Janice slot12))
      (not (unavailable Elijah slot12))
      (not (unavailable Theresa slot12))
    )
    :effect (and
      (scheduled)
      (scheduled-at slot12)
    )
    :costs 12
  )
  (:action schedule-slot13
    :parameters ()
    :precondition (and
      (not (scheduled))
      (not (unavailable Marie slot13))
      (not (unavailable Janice slot13))
      (not (unavailable Elijah slot13))
      (not (unavailable Theresa slot13))
    )
    :effect (and
      (scheduled)
      (scheduled-at slot13)
    )
    :costs 13
  )
  (:action schedule-slot14
    :parameters ()
    :precondition (and
      (not (scheduled))
      (not (unavailable Marie slot14))
      (not (unavailable Janice slot14))
      (not (unavailable Elijah slot14))
      (not (unavailable Theresa slot14))
    )
    :effect (and
      (scheduled)
      (scheduled-at slot14)
    )
    :costs 14
  )
  (:action schedule-slot15
    :parameters ()
    :precondition (and
      (not (scheduled))
      (not (unavailable Marie slot15))
      (not (unavailable Janice slot15))
      (not (unavailable Elijah slot15))
      (not (unavailable Theresa slot15))
    )
    :effect (and
      (scheduled)
      (scheduled-at slot15)
    )
    :costs 15
  )
  (:action schedule-slot16
    :parameters ()
    :precondition (and
      (not (scheduled))
      (not (unavailable Marie slot16))
      (not (unavailable Janice slot16))
      (not (unavailable Elijah slot16))
      (not (unavailable Theresa slot16))
    )
    :effect (and
      (scheduled)
      (scheduled-at slot16)
    )
    :costs 16
  )
)