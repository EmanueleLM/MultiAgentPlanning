(define (domain meeting-scheduling-multiagent)
  (:requirements :typing :strips)
  (:types agent halfslot start - halfslot)
  (:predicates
    (next ?s - start ?h - halfslot)
    (free ?a - agent ?h - halfslot)
    (confirmed ?a - agent ?s - start)
    (meeting-scheduled ?s - start)
    (goal-achieved)
  )

  (:action michelle_confirm
    :parameters (?s - start ?h2 - halfslot)
    :precondition (and (next ?s ?h2)
                       (free michelle ?s)
                       (free michelle ?h2))
    :effect (confirmed michelle ?s)
  )

  (:action steven_confirm
    :parameters (?s - start ?h2 - halfslot)
    :precondition (and (next ?s ?h2)
                       (free steven ?s)
                       (free steven ?h2))
    :effect (confirmed steven ?s)
  )

  (:action jerry_confirm
    :parameters (?s - start ?h2 - halfslot)
    :precondition (and (next ?s ?h2)
                       (free jerry ?s)
                       (free jerry ?h2))
    :effect (confirmed jerry ?s)
  )

  (:action schedule_meeting
    :parameters (?s - start)
    :precondition (and (confirmed michelle ?s)
                       (confirmed steven ?s)
                       (confirmed jerry ?s))
    :effect (meeting-scheduled ?s)
  )

  (:action achieve_goal
    :parameters (?s - start)
    :precondition (meeting-scheduled ?s)
    :effect (goal-achieved)
  )
)