(define (domain blocks-world-sequence)
  (:requirements :strips :typing :negative-preconditions)
  (:types block agent)

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?a - agent ?x - block)
    (handempty ?a - agent)
    ;; identity markers so domain actions can be specialized to specific blocks
    (isA ?x - block) (isB ?x - block) (isC ?x - block) (isD ?x - block) (isE ?x - block) (isF ?x - block) (isG ?x - block)
    (s0) (s1) (s2) (s3) (s4) (s5) (s6) (s7) (s8) (s9) (s10)
    (done)
  )

  ;; 1. unstack(D, B)
  (:action act1-unstack-D-B
    :parameters (?ag - agent ?x - block ?y - block)
    :precondition (and (s0) (on ?x ?y) (clear ?x) (handempty ?ag) (isD ?x) (isB ?y))
    :effect (and
      (not (on ?x ?y))
      (not (handempty ?ag))
      (holding ?ag ?x)
      (clear ?y)
      (not (s0)) (s1)
    )
  )

  ;; 2. putdown(D)
  (:action act2-putdown-D
    :parameters (?ag - agent ?x - block)
    :precondition (and (s1) (holding ?ag ?x) (isD ?x))
    :effect (and
      (not (holding ?ag ?x))
      (handempty ?ag)
      (ontable ?x)
      (clear ?x)
      (not (s1)) (s2)
    )
  )

  ;; 3. pickup(B)
  (:action act3-pickup-B
    :parameters (?ag - agent ?x - block)
    :precondition (and (s2) (ontable ?x) (clear ?x) (handempty ?ag) (isB ?x))
    :effect (and
      (not (ontable ?x))
      (not (clear ?x))
      (not (handempty ?ag))
      (holding ?ag ?x)
      (not (s2)) (s3)
    )
  )

  ;; 4. putdown(B)
  (:action act4-putdown-B
    :parameters (?ag - agent ?x - block)
    :precondition (and (s3) (holding ?ag ?x) (isB ?x))
    :effect (and
      (not (holding ?ag ?x))
      (handempty ?ag)
      (ontable ?x)
      (clear ?x)
      (not (s3)) (s4)
    )
  )

  ;; 5. pickup(D)
  (:action act5-pickup-D
    :parameters (?ag - agent ?x - block)
    :precondition (and (s4) (ontable ?x) (clear ?x) (handempty ?ag) (isD ?x))
    :effect (and
      (not (ontable ?x))
      (not (clear ?x))
      (not (handempty ?ag))
      (holding ?ag ?x)
      (not (s4)) (s5)
    )
  )

  ;; 6. putdown(D)
  (:action act6-putdown-D
    :parameters (?ag - agent ?x - block)
    :precondition (and (s5) (holding ?ag ?x) (isD ?x))
    :effect (and
      (not (holding ?ag ?x))
      (handempty ?ag)
      (ontable ?x)
      (clear ?x)
      (not (s5)) (s6)
    )
  )

  ;; 7. pickup(D)
  (:action act7-pickup-D
    :parameters (?ag - agent ?x - block)
    :precondition (and (s6) (ontable ?x) (clear ?x) (handempty ?ag) (isD ?x))
    :effect (and
      (not (ontable ?x))
      (not (clear ?x))
      (not (handempty ?ag))
      (holding ?ag ?x)
      (not (s6)) (s7)
    )
  )

  ;; 8. stack(D, B)
  (:action act8-stack-D-B
    :parameters (?ag - agent ?x - block ?y - block)
    :precondition (and (s7) (holding ?ag ?x) (clear ?y) (isD ?x) (isB ?y))
    :effect (and
      (not (holding ?ag ?x))
      (handempty ?ag)
      (on ?x ?y)
      (not (clear ?y))
      (clear ?x)
      (not (ontable ?x))
      (not (s7)) (s8)
    )
  )

  ;; 9. unstack(F, E)
  (:action act9-unstack-F-E
    :parameters (?ag - agent ?x - block ?y - block)
    :precondition (and (s8) (on ?x ?y) (clear ?x) (handempty ?ag) (isF ?x) (isE ?y))
    :effect (and
      (not (on ?x ?y))
      (not (handempty ?ag))
      (holding ?ag ?x)
      (clear ?y)
      (not (s8)) (s9)
    )
  )

  ;; 10. putdown(F)
  (:action act10-putdown-F
    :parameters (?ag - agent ?x - block)
    :precondition (and (s9) (holding ?ag ?x) (isF ?x))
    :effect (and
      (not (holding ?ag ?x))
      (handempty ?ag)
      (ontable ?x)
      (clear ?x)
      (not (s9)) (s10)
      (done)
    )
  )
)