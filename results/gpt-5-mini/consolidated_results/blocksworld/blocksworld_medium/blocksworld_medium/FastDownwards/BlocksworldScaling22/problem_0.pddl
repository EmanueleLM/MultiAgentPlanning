(define (problem orchestrated_blocks_problem)
  (:domain orchestrated_blocks)

  (:objects
    lifter1 placer1 - agent
    a b c - block
    p1 p2 p3 - place
    liftPhase placePhase - phase
  )

  (:init
    ; initial locations: all blocks are on distinct table places and are clear
    (ontable a p1)
    (ontable b p2)
    (ontable c p3)
    (clear a)
    (clear b)
    (clear c)

    ; both agents start with empty hands
    (handempty lifter1)
    (handempty placer1)

    ; phases: start in lift phase only
    (phase-active liftPhase)
    ; placePhase is not active initially (implicitly false)
  )

  (:goal
    (and
      ; final mandated terminal conditions:
      ; - a must be on top of b
      ; - b must be on place p2
      ; - both agents must have empty hands at termination
      (on a b)
      (ontable b p2)
      (handempty lifter1)
      (handempty placer1)
    )
  )
)