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

  (:action pickup-C-by-alpha
    :parameters ()
    :precondition (and (current s0) (ontable C) (clear C) (handempty mover_alpha) (nobody-holding))
    :effect (and
      (not (ontable C))
      (not (handempty mover_alpha))
      (not (nobody-holding))
      (holding mover_alpha C)
      (not (current s0))
      (current s1)
    )
  )

  (:action stack-C-on-A-by-alpha
    :parameters ()
    :precondition (and (current s1) (holding mover_alpha C) (clear A))
    :effect (and
      (on C A)
      (clear C)
      (not (clear A))
      (not (holding mover_alpha C))
      (handempty mover_alpha)
      (not (current s1))
      (current s2)
    )
  )

  (:action unstack-C-from-A-by-beta
    :parameters ()
    :precondition (and (current s2) (on C A) (clear C) (handempty mover_beta) (nobody-holding))
    :effect (and
      (not (on C A))
      (holding mover_beta C)
      (not (handempty mover_beta))
      (not (nobody-holding))
      (clear A)
      (not (current s2))
      (current s3)
    )
  )

  (:action stack-C-on-B-by-beta
    :parameters ()
    :precondition (and (current s3) (holding mover_beta C) (clear B))
    :effect (and
      (on C B)
      (clear C)
      (not (clear B))
      (not (holding mover_beta C))
      (handempty mover_beta)
      (not (current s3))
      (current s4)
    )
  )

  (:action unstack-A-from-E-by-alpha
    :parameters ()
    :precondition (and (current s4) (on A E) (clear A) (handempty mover_alpha) (nobody-holding))
    :effect (and
      (not (on A E))
      (holding mover_alpha A)
      (not (handempty mover_alpha))
      (not (nobody-holding))
      (clear E)
      (not (current s4))
      (current s5)
    )
  )

  (:action putdown-A-by-alpha
    :parameters ()
    :precondition (and (current s5) (holding mover_alpha A))
    :effect (and
      (ontable A)
      (clear A)
      (not (holding mover_alpha A))
      (handempty mover_alpha)
      (not (current s5))
      (current s6)
    )
  )

  (:action unstack-E-from-F-by-beta
    :parameters ()
    :precondition (and (current s6) (on E F) (clear E) (handempty mover_beta) (nobody-holding))
    :effect (and
      (not (on E F))
      (holding mover_beta E)
      (not (handempty mover_beta))
      (not (nobody-holding))
      (clear F)
      (not (current s6))
      (current s7)
    )
  )

  (:action stack-E-on-C-by-beta
    :parameters ()
    :precondition (and (current s7) (holding mover_beta E) (clear C))
    :effect (and
      (on E C)
      (clear E)
      (not (clear C))
      (not (holding mover_beta E))
      (handempty mover_beta)
      (not (current s7))
      (current s8)
    )
  )

  (:action unstack-F-from-D-by-alpha
    :parameters ()
    :precondition (and (current s8) (on F D) (clear F) (handempty mover_alpha) (nobody-holding))
    :effect (and
      (not (on F D))
      (holding mover_alpha F)
      (not (handempty mover_alpha))
      (not (nobody-holding))
      (clear D)
      (not (current s8))
      (current s9)
    )
  )

  (:action stack-F-on-D-by-alpha
    :parameters ()
    :precondition (and (current s9) (holding mover_alpha F) (clear D))
    :effect (and
      (on F D)
      (clear F)
      (not (clear D))
      (not (holding mover_alpha F))
      (handempty mover_alpha)
      (not (current s9))
      (current s10)
    )
  )
)