(define (problem multiagent-blocks-orchestrator-problem)
  (:domain multiagent-blocks-orchestrator)

  (:objects
    vowel_agent consonant_agent - agent
    A B C D E F G I - block
    slot1 slot2 slot3 - slot
  )

  (:init
    ;; agent capabilities
    (can-pick vowel_agent A)
    (can-pick vowel_agent E)
    (can-pick vowel_agent I)

    (can-pick consonant_agent B)
    (can-pick consonant_agent C)
    (can-pick consonant_agent D)
    (can-pick consonant_agent F)
    (can-pick consonant_agent G)

    ;; agents start with empty hands
    (handempty vowel_agent)
    (handempty consonant_agent)

    ;; initial stacks (bottom ... top)
    ;; stack mapped to slots: slot1 contains D (bottom) -> C -> B -> A (top)
    (ontable D slot1)
    (on C D)
    (on B C)
    (on A B)
    (top A)

    ;; slot2 contains E (bottom) -> G -> I -> F (top)
    (ontable E slot2)
    (on G E)
    (on I G)
    (on F I)
    (top F)

    ;; slot3 is empty (max 3 stacks enforced by available slots)
    (empty-slot slot3)
  )

  (:goal (and
    ;; Goal requires two stacks:
    ;; stackA (slot1): bottom A -> B -> D -> E (bottom-to-top: A,B,D,E)
    ;; Represent bottom-to-top by ontables and on relations:
    (ontable A slot1)
    (on B A)
    (on D B)
    (on E D)
    (top E)

    ;; stackF (slot2): bottom F -> C -> I -> G
    (ontable F slot2)
    (on C F)
    (on I C)
    (on G I)
    (top G)

    ;; exactly 2 stacks used: slot3 must be empty
    (empty-slot slot3)
  ))
)