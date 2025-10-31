(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types slot participant)
  (:predicates
    (free ?p - participant ?s - slot)
    (scheduled)
    (meeting-at ?s - slot)
  )

  (:action schedule
     :parameters (?s - slot ?alan ?michael ?michelle ?roy ?judy ?natalie ?brian - participant)
     :precondition (and
       (not (scheduled))
       (free ?alan ?s)
       (free ?michael ?s)
       (free ?michelle ?s)
       (free ?roy ?s)
       (free ?judy ?s)
       (free ?natalie ?s)
       (free ?brian ?s)
     )
     :effect (and
       (scheduled)
       (meeting-at ?s)
     )
  )
)