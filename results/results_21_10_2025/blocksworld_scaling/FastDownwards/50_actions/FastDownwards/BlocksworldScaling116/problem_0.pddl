(define (problem stacking_two_agents)
  (:domain blocks_world_agents)
  (:objects
    A E I - vowel
    B C D F G H J K - consonant
  )

  (:init
    ; Initial stacks as provided (bottom -> top)
    ; Stack1: E (bottom on table), K on E, B on K, G (top)
    (ontable E)
    (on K E)
    (on B K)
    (on G B)

    ; Stack2: F (bottom on table), J on F, I (top)
    (ontable F)
    (on J F)
    (on I J)

    ; Stack3: D (bottom on table), H on D, C on H, A (top)
    (ontable D)
    (on H D)
    (on C H)
    (on A C)

    ; Clear (top) blocks initially
    (clear G)
    (clear I)
    (clear A)
  )

  (:goal (and
    ; Final desired single stack bottom-to-top:
    ; K on table, then J on K, I on J, H on I, G on H, F on G,
    ; E on F, D on E, C on D, B on C, A on B.
    (ontable K)
    (on J K)
    (on I J)
    (on H I)
    (on G H)
    (on F G)
    (on E F)
    (on D E)
    (on C D)
    (on B C)
    (on A B)
    ; topmost is A
    (clear A)
  ))
)