(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types agent slot)
  (:constants margaret donna helen - agent)
  (:predicates
    (busy ?a - agent ?s - slot)
    (agreed ?a - agent ?s - slot)
    (scheduled_slot ?s - slot)
    (meeting_scheduled)
    (allowed-slot ?s - slot)
  )

  (:action agree-margaret
    :parameters (?s - slot)
    :precondition (and (not (busy margaret ?s)) (not (agreed margaret ?s)) (not (meeting_scheduled)))
    :effect (agreed margaret ?s)
  )

  (:action agree-donna
    :parameters (?s - slot)
    :precondition (and (not (busy donna ?s)) (not (agreed donna ?s)) (not (meeting_scheduled)))
    :effect (agreed donna ?s)
  )

  (:action agree-helen
    :parameters (?s - slot)
    :precondition (and (not (busy helen ?s)) (not (agreed helen ?s)) (not (meeting_scheduled)) (allowed-slot ?s))
    :effect (agreed helen ?s)
  )

  (:action finalize-slot-09_00
    :precondition (and (agreed margaret slot-09_00) (agreed donna slot-09_00) (agreed helen slot-09_00) (not (meeting_scheduled)))
    :effect (and (meeting_scheduled) (scheduled_slot slot-09_00))
    :cost 0
  )
  (:action finalize-slot-09_30
    :precondition (and (agreed margaret slot-09_30) (agreed donna slot-09_30) (agreed helen slot-09_30) (not (meeting_scheduled)))
    :effect (and (meeting_scheduled) (scheduled_slot slot-09_30))
    :cost 1
  )
  (:action finalize-slot-10_00
    :precondition (and (agreed margaret slot-10_00) (agreed donna slot-10_00) (agreed helen slot-10_00) (not (meeting_scheduled)))
    :effect (and (meeting_scheduled) (scheduled_slot slot-10_00))
    :cost 2
  )
  (:action finalize-slot-10_30
    :precondition (and (agreed margaret slot-10_30) (agreed donna slot-10_30) (agreed helen slot-10_30) (not (meeting_scheduled)))
    :effect (and (meeting_scheduled) (scheduled_slot slot-10_30))
    :cost 3
  )
  (:action finalize-slot-11_00
    :precondition (and (agreed margaret slot-11_00) (agreed donna slot-11_00) (agreed helen slot-11_00) (not (meeting_scheduled)))
    :effect (and (meeting_scheduled) (scheduled_slot slot-11_00))
    :cost 4
  )
  (:action finalize-slot-11_30
    :precondition (and (agreed margaret slot-11_30) (agreed donna slot-11_30) (agreed helen slot-11_30) (not (meeting_scheduled)))
    :effect (and (meeting_scheduled) (scheduled_slot slot-11_30))
    :cost 5
  )
  (:action finalize-slot-12_00
    :precondition (and (agreed margaret slot-12_00) (agreed donna slot-12_00) (agreed helen slot-12_00) (not (meeting_scheduled)))
    :effect (and (meeting_scheduled) (scheduled_slot slot-12_00))
    :cost 6
  )
  (:action finalize-slot-12_30
    :precondition (and (agreed margaret slot-12_30) (agreed donna slot-12_30) (agreed helen slot-12_30) (not (meeting_scheduled)))
    :effect (and (meeting_scheduled) (scheduled_slot slot-12_30))
    :cost 7
  )
  (:action finalize-slot-13_00
    :precondition (and (agreed margaret slot-13_00) (agreed donna slot-13_00) (agreed helen slot-13_00) (not (meeting_scheduled)))
    :effect (and (meeting_scheduled) (scheduled_slot slot-13_00))
    :cost 8
  )
  (:action finalize-slot-13_30
    :precondition (and (agreed margaret slot-13_30) (agreed donna slot-13_30) (agreed helen slot-13_30) (not (meeting_scheduled)))
    :effect (and (meeting_scheduled) (scheduled_slot slot-13_30))
    :cost 9
  )
  (:action finalize-slot-14_00
    :precondition (and (agreed margaret slot-14_00) (agreed donna slot-14_00) (agreed helen slot-14_00) (not (meeting_scheduled)))
    :effect (and (meeting_scheduled) (scheduled_slot slot-14_00))
    :cost 10
  )
  (:action finalize-slot-14_30
    :precondition (and (agreed margaret slot-14_30) (agreed donna slot-14_30) (agreed helen slot-14_30) (not (meeting_scheduled)))
    :effect (and (meeting_scheduled) (scheduled_slot slot-14_30))
    :cost 11
  )
  (:action finalize-slot-15_00
    :precondition (and (agreed margaret slot-15_00) (agreed donna slot-15_00) (agreed helen slot-15_00) (not (meeting_scheduled)))
    :effect (and (meeting_scheduled) (scheduled_slot slot-15_00))
    :cost 12
  )
  (:action finalize-slot-15_30
    :precondition (and (agreed margaret slot-15_30) (agreed donna slot-15_30) (agreed helen slot-15_30) (not (meeting_scheduled)))
    :effect (and (meeting_scheduled) (scheduled_slot slot-15_30))
    :cost 13
  )
  (:action finalize-slot-16_00
    :precondition (and (agreed margaret slot-16_00) (agreed donna slot-16_00) (agreed helen slot-16_00) (not (meeting_scheduled)))
    :effect (and (meeting_scheduled) (scheduled_slot slot-16_00))
    :cost 14
  )
  (:action finalize-slot-16_30
    :precondition (and (agreed margaret slot-16_30) (agreed donna slot-16_30) (agreed helen slot-16_30) (not (meeting_scheduled)))
    :effect (and (meeting_scheduled) (scheduled_slot slot-16_30))
    :cost 15
  )
)