(define (domain orchestrator)
  (:requirements :strips :typing :negative-preconditions :action-costs :equality)
  (:types person slot)

  (:predicates
    (available ?p - person ?s - slot)
    (free ?p - person)
    (attending ?p - person ?s - slot)
    (meeting-scheduled)
    (meeting-at ?s - slot)
    (janice-pref ?s - slot)
    (is-09-00 ?s - slot)
    (is-09-30 ?s - slot)
    (is-10-00 ?s - slot)
    (is-10-30 ?s - slot)
    (is-11-00 ?s - slot)
    (is-11-30 ?s - slot)
    (is-12-00 ?s - slot)
    (is-12-30 ?s - slot)
    (is-13-00 ?s - slot)
    (is-13-30 ?s - slot)
    (is-14-00 ?s - slot)
    (is-14-30 ?s - slot)
    (is-15-00 ?s - slot)
    (is-15-30 ?s - slot)
    (is-16-00 ?s - slot)
    (is-16-30 ?s - slot)
  )

  (:action attend-christine
    :parameters (?s - slot)
    :precondition (and (available christine ?s) (free christine))
    :effect (and (attending christine ?s) (not (free christine)))
    :cost 0
  )

  (:action attend-janice
    :parameters (?s - slot)
    :precondition (and (available janice ?s) (free janice))
    :effect (and (attending janice ?s) (not (free janice)))
    :cost 0
  )

  (:action attend-bobby
    :parameters (?s - slot)
    :precondition (and (available bobby ?s) (free bobby))
    :effect (and (attending bobby ?s) (not (free bobby)))
    :cost 0
  )

  (:action attend-elizabeth
    :parameters (?s - slot)
    :precondition (and (available elizabeth ?s) (free elizabeth))
    :effect (and (attending elizabeth ?s) (not (free elizabeth)))
    :cost 0
  )

  (:action attend-tyler
    :parameters (?s - slot)
    :precondition (and (available tyler ?s) (free tyler))
    :effect (and (attending tyler ?s) (not (free tyler)))
    :cost 0
  )

  (:action attend-edward
    :parameters (?s - slot)
    :precondition (and (available edward ?s) (free edward))
    :effect (and (attending edward ?s) (not (free edward)))
    :cost 0
  )

  (:action start-meeting-09-00
    :parameters ()
    :precondition (and (not (meeting-scheduled))
                       (attending christine slot_09_00)
                       (attending janice slot_09_00)
                       (attending bobby slot_09_00)
                       (attending elizabeth slot_09_00)
                       (attending tyler slot_09_00)
                       (attending edward slot_09_00))
    :effect (and (meeting-scheduled) (meeting-at slot_09_00))
    :cost 0
  )

  (:action start-meeting-09-30
    :parameters ()
    :precondition (and (not (meeting-scheduled))
                       (attending christine slot_09_30)
                       (attending janice slot_09_30)
                       (attending bobby slot_09_30)
                       (attending elizabeth slot_09_30)
                       (attending tyler slot_09_30)
                       (attending edward slot_09_30))
    :effect (and (meeting-scheduled) (meeting-at slot_09_30))
    :cost 1
  )

  (:action start-meeting-10-00
    :parameters ()
    :precondition (and (not (meeting-scheduled))
                       (attending christine slot_10_00)
                       (attending janice slot_10_00)
                       (attending bobby slot_10_00)
                       (attending elizabeth slot_10_00)
                       (attending tyler slot_10_00)
                       (attending edward slot_10_00))
    :effect (and (meeting-scheduled) (meeting-at slot_10_00))
    :cost 2
  )

  (:action start-meeting-10-30
    :parameters ()
    :precondition (and (not (meeting-scheduled))
                       (attending christine slot_10_30)
                       (attending janice slot_10_30)
                       (attending bobby slot_10_30)
                       (attending elizabeth slot_10_30)
                       (attending tyler slot_10_30)
                       (attending edward slot_10_30))
    :effect (and (meeting-scheduled) (meeting-at slot_10_30))
    :cost 3
  )

  (:action start-meeting-11-00
    :parameters ()
    :precondition (and (not (meeting-scheduled))
                       (attending christine slot_11_00)
                       (attending janice slot_11_00)
                       (attending bobby slot_11_00)
                       (attending elizabeth slot_11_00)
                       (attending tyler slot_11_00)
                       (attending edward slot_11_00))
    :effect (and (meeting-scheduled) (meeting-at slot_11_00))
    :cost 4
  )

  (:action start-meeting-11-30
    :parameters ()
    :precondition (and (not (meeting-scheduled))
                       (attending christine slot_11_30)
                       (attending janice slot_11_30)
                       (attending bobby slot_11_30)
                       (attending elizabeth slot_11_30)
                       (attending tyler slot_11_30)
                       (attending edward slot_11_30))
    :effect (and (meeting-scheduled) (meeting-at slot_11_30))
    :cost 5
  )

  (:action start-meeting-12-00
    :parameters ()
    :precondition (and (not (meeting-scheduled))
                       (attending christine slot_12_00)
                       (attending janice slot_12_00)
                       (attending bobby slot_12_00)
                       (attending elizabeth slot_12_00)
                       (attending tyler slot_12_00)
                       (attending edward slot_12_00))
    :effect (and (meeting-scheduled) (meeting-at slot_12_00))
    :cost 6
  )

  (:action start-meeting-12-30
    :parameters ()
    :precondition (and (not (meeting-scheduled))
                       (attending christine slot_12_30)
                       (attending janice slot_12_30)
                       (attending bobby slot_12_30)
                       (attending elizabeth slot_12_30)
                       (attending tyler slot_12_30)
                       (attending edward slot_12_30))
    :effect (and (meeting-scheduled) (meeting-at slot_12_30))
    :cost 7
  )

  (:action start-meeting-13-00
    :parameters ()
    :precondition (and (not (meeting-scheduled))
                       (attending christine slot_13_00)
                       (attending janice slot_13_00)
                       (attending bobby slot_13_00)
                       (attending elizabeth slot_13_00)
                       (attending tyler slot_13_00)
                       (attending edward slot_13_00))
    :effect (and (meeting-scheduled) (meeting-at slot_13_00))
    :cost 9
  )

  (:action start-meeting-13-30
    :parameters ()
    :precondition (and (not (meeting-scheduled))
                       (attending christine slot_13_30)
                       (attending janice slot_13_30)
                       (attending bobby slot_13_30)
                       (attending elizabeth slot_13_30)
                       (attending tyler slot_13_30)
                       (attending edward slot_13_30))
    :effect (and (meeting-scheduled) (meeting-at slot_13_30))
    :cost 10
  )

  (:action start-meeting-14-00
    :parameters ()
    :precondition (and (not (meeting-scheduled))
                       (attending christine slot_14_00)
                       (attending janice slot_14_00)
                       (attending bobby slot_14_00)
                       (attending elizabeth slot_14_00)
                       (attending tyler slot_14_00)
                       (attending edward slot_14_00))
    :effect (and (meeting-scheduled) (meeting-at slot_14_00))
    :cost 11
  )

  (:action start-meeting-14-30
    :parameters ()
    :precondition (and (not (meeting-scheduled))
                       (attending christine slot_14_30)
                       (attending janice slot_14_30)
                       (attending bobby slot_14_30)
                       (attending elizabeth slot_14_30)
                       (attending tyler slot_14_30)
                       (attending edward slot_14_30))
    :effect (and (meeting-scheduled) (meeting-at slot_14_30))
    :cost 12
  )

  (:action start-meeting-15-00
    :parameters ()
    :precondition (and (not (meeting-scheduled))
                       (attending christine slot_15_00)
                       (attending janice slot_15_00)
                       (attending bobby slot_15_00)
                       (attending elizabeth slot_15_00)
                       (attending tyler slot_15_00)
                       (attending edward slot_15_00))
    :effect (and (meeting-scheduled) (meeting-at slot_15_00))
    :cost 13
  )

  (:action start-meeting-15-30
    :parameters ()
    :precondition (and (not (meeting-scheduled))
                       (attending christine slot_15_30)
                       (attending janice slot_15_30)
                       (attending bobby slot_15_30)
                       (attending elizabeth slot_15_30)
                       (attending tyler slot_15_30)
                       (attending edward slot_15_30))
    :effect (and (meeting-scheduled) (meeting-at slot_15_30))
    :cost 14
  )

  (:action start-meeting-16-00
    :parameters ()
    :precondition (and (not (meeting-scheduled))
                       (attending christine slot_16_00)
                       (attending janice slot_16_00)
                       (attending bobby slot_16_00)
                       (attending elizabeth slot_16_00)
                       (attending tyler slot_16_00)
                       (attending edward slot_16_00))
    :effect (and (meeting-scheduled) (meeting-at slot_16_00))
    :cost 15
  )

  (:action start-meeting-16-30
    :parameters ()
    :precondition (and (not (meeting-scheduled))
                       (attending christine slot_16_30)
                       (attending janice slot_16_30)
                       (attending bobby slot_16_30)
                       (attending elizabeth slot_16_30)
                       (attending tyler slot_16_30)
                       (attending edward slot_16_30))
    :effect (and (meeting-scheduled) (meeting-at slot_16_30))
    :cost 16
  )
)