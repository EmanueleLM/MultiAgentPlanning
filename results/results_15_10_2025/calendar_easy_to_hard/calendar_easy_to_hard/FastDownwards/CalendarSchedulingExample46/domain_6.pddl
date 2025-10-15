(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types slot participant)
  (:constants
    slot-0 slot-1 slot-2 slot-3 slot-4 slot-5 slot-6 slot-7
    slot-8 slot-9 slot-10 slot-11 slot-12 slot-13 slot-14 slot-15 - slot
  )
  (:predicates
    (free ?p - participant ?s - slot)
    (scheduled)
    (meeting-at ?s - slot)
  )
  (:functions (total-cost))

  (:action schedule-slot-0
     :parameters (?alan ?michael ?michelle ?roy ?judy ?natalie ?brian - participant)
     :precondition (and
       (not (scheduled))
       (free ?alan slot-0)
       (free ?michael slot-0)
       (free ?michelle slot-0)
       (free ?roy slot-0)
       (free ?judy slot-0)
       (free ?natalie slot-0)
       (free ?brian slot-0)
     )
     :effect (and
       (scheduled)
       (meeting-at slot-0)
       (increase (total-cost) 0)
     )
  )

  (:action schedule-slot-1
     :parameters (?alan ?michael ?michelle ?roy ?judy ?natalie ?brian - participant)
     :precondition (and
       (not (scheduled))
       (free ?alan slot-1)
       (free ?michael slot-1)
       (free ?michelle slot-1)
       (free ?roy slot-1)
       (free ?judy slot-1)
       (free ?natalie slot-1)
       (free ?brian slot-1)
     )
     :effect (and
       (scheduled)
       (meeting-at slot-1)
       (increase (total-cost) 1)
     )
  )

  (:action schedule-slot-2
     :parameters (?alan ?michael ?michelle ?roy ?judy ?natalie ?brian - participant)
     :precondition (and
       (not (scheduled))
       (free ?alan slot-2)
       (free ?michael slot-2)
       (free ?michelle slot-2)
       (free ?roy slot-2)
       (free ?judy slot-2)
       (free ?natalie slot-2)
       (free ?brian slot-2)
     )
     :effect (and
       (scheduled)
       (meeting-at slot-2)
       (increase (total-cost) 2)
     )
  )

  (:action schedule-slot-3
     :parameters (?alan ?michael ?michelle ?roy ?judy ?natalie ?brian - participant)
     :precondition (and
       (not (scheduled))
       (free ?alan slot-3)
       (free ?michael slot-3)
       (free ?michelle slot-3)
       (free ?roy slot-3)
       (free ?judy slot-3)
       (free ?natalie slot-3)
       (free ?brian slot-3)
     )
     :effect (and
       (scheduled)
       (meeting-at slot-3)
       (increase (total-cost) 3)
     )
  )

  (:action schedule-slot-4
     :parameters (?alan ?michael ?michelle ?roy ?judy ?natalie ?brian - participant)
     :precondition (and
       (not (scheduled))
       (free ?alan slot-4)
       (free ?michael slot-4)
       (free ?michelle slot-4)
       (free ?roy slot-4)
       (free ?judy slot-4)
       (free ?natalie slot-4)
       (free ?brian slot-4)
     )
     :effect (and
       (scheduled)
       (meeting-at slot-4)
       (increase (total-cost) 4)
     )
  )

  (:action schedule-slot-5
     :parameters (?alan ?michael ?michelle ?roy ?judy ?natalie ?brian - participant)
     :precondition (and
       (not (scheduled))
       (free ?alan slot-5)
       (free ?michael slot-5)
       (free ?michelle slot-5)
       (free ?roy slot-5)
       (free ?judy slot-5)
       (free ?natalie slot-5)
       (free ?brian slot-5)
     )
     :effect (and
       (scheduled)
       (meeting-at slot-5)
       (increase (total-cost) 5)
     )
  )

  (:action schedule-slot-6
     :parameters (?alan ?michael ?michelle ?roy ?judy ?natalie ?brian - participant)
     :precondition (and
       (not (scheduled))
       (free ?alan slot-6)
       (free ?michael slot-6)
       (free ?michelle slot-6)
       (free ?roy slot-6)
       (free ?judy slot-6)
       (free ?natalie slot-6)
       (free ?brian slot-6)
     )
     :effect (and
       (scheduled)
       (meeting-at slot-6)
       (increase (total-cost) 6)
     )
  )

  (:action schedule-slot-7
     :parameters (?alan ?michael ?michelle ?roy ?judy ?natalie ?brian - participant)
     :precondition (and
       (not (scheduled))
       (free ?alan slot-7)
       (free ?michael slot-7)
       (free ?michelle slot-7)
       (free ?roy slot-7)
       (free ?judy slot-7)
       (free ?natalie slot-7)
       (free ?brian slot-7)
     )
     :effect (and
       (scheduled)
       (meeting-at slot-7)
       (increase (total-cost) 7)
     )
  )

  (:action schedule-slot-8
     :parameters (?alan ?michael ?michelle ?roy ?judy ?natalie ?brian - participant)
     :precondition (and
       (not (scheduled))
       (free ?alan slot-8)
       (free ?michael slot-8)
       (free ?michelle slot-8)
       (free ?roy slot-8)
       (free ?judy slot-8)
       (free ?natalie slot-8)
       (free ?brian slot-8)
     )
     :effect (and
       (scheduled)
       (meeting-at slot-8)
       (increase (total-cost) 8)
     )
  )

  (:action schedule-slot-9
     :parameters (?alan ?michael ?michelle ?roy ?judy ?natalie ?brian - participant)
     :precondition (and
       (not (scheduled))
       (free ?alan slot-9)
       (free ?michael slot-9)
       (free ?michelle slot-9)
       (free ?roy slot-9)
       (free ?judy slot-9)
       (free ?natalie slot-9)
       (free ?brian slot-9)
     )
     :effect (and
       (scheduled)
       (meeting-at slot-9)
       (increase (total-cost) 9)
     )
  )

  (:action schedule-slot-10
     :parameters (?alan ?michael ?michelle ?roy ?judy ?natalie ?brian - participant)
     :precondition (and
       (not (scheduled))
       (free ?alan slot-10)
       (free ?michael slot-10)
       (free ?michelle slot-10)
       (free ?roy slot-10)
       (free ?judy slot-10)
       (free ?natalie slot-10)
       (free ?brian slot-10)
     )
     :effect (and
       (scheduled)
       (meeting-at slot-10)
       (increase (total-cost) 10)
     )
  )

  (:action schedule-slot-11
     :parameters (?alan ?michael ?michelle ?roy ?judy ?natalie ?brian - participant)
     :precondition (and
       (not (scheduled))
       (free ?alan slot-11)
       (free ?michael slot-11)
       (free ?michelle slot-11)
       (free ?roy slot-11)
       (free ?judy slot-11)
       (free ?natalie slot-11)
       (free ?brian slot-11)
     )
     :effect (and
       (scheduled)
       (meeting-at slot-11)
       (increase (total-cost) 11)
     )
  )

  (:action schedule-slot-12
     :parameters (?alan ?michael ?michelle ?roy ?judy ?natalie ?brian - participant)
     :precondition (and
       (not (scheduled))
       (free ?alan slot-12)
       (free ?michael slot-12)
       (free ?michelle slot-12)
       (free ?roy slot-12)
       (free ?judy slot-12)
       (free ?natalie slot-12)
       (free ?brian slot-12)
     )
     :effect (and
       (scheduled)
       (meeting-at slot-12)
       (increase (total-cost) 12)
     )
  )

  (:action schedule-slot-13
     :parameters (?alan ?michael ?michelle ?roy ?judy ?natalie ?brian - participant)
     :precondition (and
       (not (scheduled))
       (free ?alan slot-13)
       (free ?michael slot-13)
       (free ?michelle slot-13)
       (free ?roy slot-13)
       (free ?judy slot-13)
       (free ?natalie slot-13)
       (free ?brian slot-13)
     )
     :effect (and
       (scheduled)
       (meeting-at slot-13)
       (increase (total-cost) 13)
     )
  )

  (:action schedule-slot-14
     :parameters (?alan ?michael ?michelle ?roy ?judy ?natalie ?brian - participant)
     :precondition (and
       (not (scheduled))
       (free ?alan slot-14)
       (free ?michael slot-14)
       (free ?michelle slot-14)
       (free ?roy slot-14)
       (free ?judy slot-14)
       (free ?natalie slot-14)
       (free ?brian slot-14)
     )
     :effect (and
       (scheduled)
       (meeting-at slot-14)
       (increase (total-cost) 14)
     )
  )

  (:action schedule-slot-15
     :parameters (?alan ?michael ?michelle ?roy ?judy ?natalie ?brian - participant)
     :precondition (and
       (not (scheduled))
       (free ?alan slot-15)
       (free ?michael slot-15)
       (free ?michelle slot-15)
       (free ?roy slot-15)
       (free ?judy slot-15)
       (free ?natalie slot-15)
       (free ?brian slot-15)
     )
     :effect (and
       (scheduled)
       (meeting-at slot-15)
       (increase (total-cost) 15)
     )
  )
)