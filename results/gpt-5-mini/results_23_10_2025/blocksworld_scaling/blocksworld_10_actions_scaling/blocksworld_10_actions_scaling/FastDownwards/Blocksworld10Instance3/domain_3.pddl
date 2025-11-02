(define (domain Blocksworld10Instance3)
  (:requirements :strips :typing :negative-preconditions)
  (:types block agent step)

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?ag - agent ?x - block)
    (handempty ?ag - agent)
    (nobody-holding)
    (current ?s - step)
  )

  (:action pickup-c-by-alpha
    :parameters (?from - step ?to - step)
    :precondition (and (current ?from) (ontable c) (clear c) (handempty mover_alpha) (nobody-holding))
    :effect (and
      (not (ontable c))
      (not (handempty mover_alpha))
      (not (nobody-holding))
      (holding mover_alpha c)
      (not (current ?from))
      (current ?to)
    )
  )

  (:action stack-c-on-a-by-alpha
    :parameters (?from - step ?to - step)
    :precondition (and (current ?from) (holding mover_alpha c) (clear a))
    :effect (and
      (on c a)
      (clear c)
      (not (clear a))
      (not (holding mover_alpha c))
      (handempty mover_alpha)
      (not (current ?from))
      (current ?to)
    )
  )

  (:action unstack-c-from-a-by-beta
    :parameters (?from - step ?to - step)
    :precondition (and (current ?from) (on c a) (clear c) (handempty mover_beta) (nobody-holding))
    :effect (and
      (not (on c a))
      (holding mover_beta c)
      (not (handempty mover_beta))
      (not (nobody-holding))
      (clear a)
      (not (current ?from))
      (current ?to)
    )
  )

  (:action stack-c-on-b-by-beta
    :parameters (?from - step ?to - step)
    :precondition (and (current ?from) (holding mover_beta c) (clear b))
    :effect (and
      (on c b)
      (clear c)
      (not (clear b))
      (not (holding mover_beta c))
      (handempty mover_beta)
      (not (current ?from))
      (current ?to)
    )
  )

  (:action unstack-a-from-e-by-alpha
    :parameters (?from - step ?to - step)
    :precondition (and (current ?from) (on a e) (clear a) (handempty mover_alpha) (nobody-holding))
    :effect (and
      (not (on a e))
      (holding mover_alpha a)
      (not (handempty mover_alpha))
      (not (nobody-holding))
      (clear e)
      (not (current ?from))
      (current ?to)
    )
  )

  (:action putdown-a-by-alpha
    :parameters (?from - step ?to - step)
    :precondition (and (current ?from) (holding mover_alpha a))
    :effect (and
      (ontable a)
      (clear a)
      (not (holding mover_alpha a))
      (handempty mover_alpha)
      (not (current ?from))
      (current ?to)
    )
  )

  (:action unstack-e-from-f-by-beta
    :parameters (?from - step ?to - step)
    :precondition (and (current ?from) (on e f) (clear e) (handempty mover_beta) (nobody-holding))
    :effect (and
      (not (on e f))
      (holding mover_beta e)
      (not (handempty mover_beta))
      (not (nobody-holding))
      (clear f)
      (not (current ?from))
      (current ?to)
    )
  )

  (:action stack-e-on-c-by-beta
    :parameters (?from - step ?to - step)
    :precondition (and (current ?from) (holding mover_beta e) (clear c))
    :effect (and
      (on e c)
      (clear e)
      (not (clear c))
      (not (holding mover_beta e))
      (handempty mover_beta)
      (not (current ?from))
      (current ?to)
    )
  )

  (:action unstack-f-from-d-by-alpha
    :parameters (?from - step ?to - step)
    :precondition (and (current ?from) (on f d) (clear f) (handempty mover_alpha) (nobody-holding))
    :effect (and
      (not (on f d))
      (holding mover_alpha f)
      (not (handempty mover_alpha))
      (not (nobody-holding))
      (clear d)
      (not (current ?from))
      (current ?to)
    )
  )

  (:action stack-f-on-d-by-alpha
    :parameters (?from - step ?to - step)
    :precondition (and (current ?from) (holding mover_alpha f) (clear d))
    :effect (and
      (on f d)
      (clear f)
      (not (clear d))
      (not (holding mover_alpha f))
      (handempty mover_alpha)
      (not (current ?from))
      (current ?to)
    )
  )
)