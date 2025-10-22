(define (domain blocks-world-sequence)
  (:requirements :strips :typing :negative-preconditions)
  (:types block agent)

  (:predicates
    (on ?x - block ?y - block)         ; block x is on block y
    (ontable ?x - block)               ; block x is on the table
    (clear ?x - block)                 ; nothing is on block x
    (holding ?a - agent ?x - block)    ; agent a is holding block x
    (handempty ?a - agent)             ; agent a's hand is empty
    (s0) (s1) (s2) (s3) (s4) (s5) (s6) (s7) (s8) (s9) (s10)
    (done)
  )

  ;; 1. unstack(D, B)
  (:action act1-unstack-D-B
    :parameters (?ag - agent)
    :precondition (and (s0) (on D B) (clear D) (handempty ?ag))
    :effect (and
      (not (on D B))
      (not (handempty ?ag))
      (holding ?ag D)
      (clear B)
      (not (s0)) (s1)
    )
  )

  ;; 2. putdown(D)
  (:action act2-putdown-D
    :parameters (?ag - agent)
    :precondition (and (s1) (holding ?ag D))
    :effect (and
      (not (holding ?ag D))
      (handempty ?ag)
      (ontable D)
      (clear D)
      (not (s1)) (s2)
    )
  )

  ;; 3. pickup(B)
  (:action act3-pickup-B
    :parameters (?ag - agent)
    :precondition (and (s2) (ontable B) (clear B) (handempty ?ag))
    :effect (and
      (not (ontable B))
      (not (clear B))
      (not (handempty ?ag))
      (holding ?ag B)
      (not (s2)) (s3)
    )
  )

  ;; 4. putdown(B)
  (:action act4-putdown-B
    :parameters (?ag - agent)
    :precondition (and (s3) (holding ?ag B))
    :effect (and
      (not (holding ?ag B))
      (handempty ?ag)
      (ontable B)
      (clear B)
      (not (s3)) (s4)
    )
  )

  ;; 5. pickup(D)
  (:action act5-pickup-D
    :parameters (?ag - agent)
    :precondition (and (s4) (ontable D) (clear D) (handempty ?ag))
    :effect (and
      (not (ontable D))
      (not (clear D))
      (not (handempty ?ag))
      (holding ?ag D)
      (not (s4)) (s5)
    )
  )

  ;; 6. putdown(D)
  (:action act6-putdown-D
    :parameters (?ag - agent)
    :precondition (and (s5) (holding ?ag D))
    :effect (and
      (not (holding ?ag D))
      (handempty ?ag)
      (ontable D)
      (clear D)
      (not (s5)) (s6)
    )
  )

  ;; 7. pickup(D)
  (:action act7-pickup-D
    :parameters (?ag - agent)
    :precondition (and (s6) (ontable D) (clear D) (handempty ?ag))
    :effect (and
      (not (ontable D))
      (not (clear D))
      (not (handempty ?ag))
      (holding ?ag D)
      (not (s6)) (s7)
    )
  )

  ;; 8. stack(D, B)
  (:action act8-stack-D-B
    :parameters (?ag - agent)
    :precondition (and (s7) (holding ?ag D) (clear B))
    :effect (and
      (not (holding ?ag D))
      (handempty ?ag)
      (on D B)
      (not (clear B))
      (clear D)
      (not (ontable D))
      (not (s7)) (s8)
    )
  )

  ;; 9. unstack(F, E)
  (:action act9-unstack-F-E
    :parameters (?ag - agent)
    :precondition (and (s8) (on F E) (clear F) (handempty ?ag))
    :effect (and
      (not (on F E))
      (not (handempty ?ag))
      (holding ?ag F)
      (clear E)
      (not (s8)) (s9)
    )
  )

  ;; 10. putdown(F)
  (:action act10-putdown-F
    :parameters (?ag - agent)
    :precondition (and (s9) (holding ?ag F))
    :effect (and
      (not (holding ?ag F))
      (handempty ?ag)
      (ontable F)
      (clear F)
      (not (s9)) (s10)
      (done)
    )
  )
)