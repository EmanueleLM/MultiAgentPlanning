(define (domain floor-tile)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types robot tile color stage - object)

  (:predicates
    (robot-at ?r - robot ?t - tile)
    (robot-has ?r - robot ?c - color)
    (available-color ?c - color)
    (clear ?t - tile)
    (painted ?t - tile ?c - color)
    (up ?from - tile ?to - tile)
    (right ?from - tile ?to - tile)
    (current-stage ?s - stage)
    (next ?s - stage ?s2 - stage)
  )

  (:functions (total-cost))

  (:action change-color
    :parameters (?r - robot ?c - color ?c2 - color ?s - stage ?s2 - stage)
    :precondition (and
      (robot-has ?r ?c)
      (available-color ?c2)
      (not (robot-has ?r ?c2))
      (current-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (robot-has ?r ?c))
      (robot-has ?r ?c2)
      (not (current-stage ?s))
      (current-stage ?s2)
      (increase (total-cost) 5)
    )
  )

  (:action paint-up
    :parameters (?r - robot ?y - tile ?x - tile ?c - color ?s - stage ?s2 - stage)
    :precondition (and
      (robot-at ?r ?y)
      (up ?y ?x)
      (clear ?x)
      (robot-has ?r ?c)
      (current-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (painted ?x ?c)
      (not (clear ?x))
      (not (current-stage ?s))
      (current-stage ?s2)
      (increase (total-cost) 2)
    )
  )

  (:action paint-down
    :parameters (?r - robot ?y - tile ?x - tile ?c - color ?s - stage ?s2 - stage)
    :precondition (and
      (robot-at ?r ?y)
      (up ?x ?y)
      (clear ?x)
      (robot-has ?r ?c)
      (current-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (painted ?x ?c)
      (not (clear ?x))
      (not (current-stage ?s))
      (current-stage ?s2)
      (increase (total-cost) 2)
    )
  )

  (:action up
    :parameters (?r - robot ?x - tile ?y - tile ?s - stage ?s2 - stage)
    :precondition (and
      (robot-at ?r ?x)
      (up ?x ?y)
      (clear ?y)
      (current-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (robot-at ?r ?y)
      (not (robot-at ?r ?x))
      (clear ?x)
      (not (clear ?y))
      (not (current-stage ?s))
      (current-stage ?s2)
      (increase (total-cost) 3)
    )
  )

  (:action down
    :parameters (?r - robot ?x - tile ?y - tile ?s - stage ?s2 - stage)
    :precondition (and
      (robot-at ?r ?x)
      (up ?y ?x)
      (clear ?y)
      (current-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (robot-at ?r ?y)
      (not (robot-at ?r ?x))
      (clear ?x)
      (not (clear ?y))
      (not (current-stage ?s))
      (current-stage ?s2)
      (increase (total-cost) 1)
    )
  )

  (:action right
    :parameters (?r - robot ?x - tile ?y - tile ?s - stage ?s2 - stage)
    :precondition (and
      (robot-at ?r ?x)
      (right ?x ?y)
      (clear ?y)
      (current-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (robot-at ?r ?y)
      (not (robot-at ?r ?x))
      (clear ?x)
      (not (clear ?y))
      (not (current-stage ?s))
      (current-stage ?s2)
      (increase (total-cost) 1)
    )
  )

  (:action left
    :parameters (?r - robot ?x - tile ?y - tile ?s - stage ?s2 - stage)
    :precondition (and
      (robot-at ?r ?x)
      (right ?y ?x)
      (clear ?y)
      (current-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (robot-at ?r ?y)
      (not (robot-at ?r ?x))
      (clear ?x)
      (not (clear ?y))
      (not (current-stage ?s))
      (current-stage ?s2)
      (increase (total-cost) 1)
    )
  )
)