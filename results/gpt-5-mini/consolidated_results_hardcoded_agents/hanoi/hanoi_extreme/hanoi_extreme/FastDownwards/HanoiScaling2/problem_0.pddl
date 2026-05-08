; PDDL problem for 3-peg Tower of Hanoi with 7 named disks A..G.
; Initial configuration: all disks stacked on peg1 with G bottom, then F, E, D, C, B, A on top.
; Goal: move the entire stack to peg3 in the same order (G bottom ... A top).
; All natural-language preferences (e.g., avoid illegal placements) are enforced as hard constraints in the domain.

(define (problem hanoi-problem)
  (:domain hanoi-domain)

  (:objects
    ; Disks named A (smallest) .. G (largest)
    A B C D E F G - disk
    peg1 peg2 peg3 - peg
    ; note: peg and disk types are subtypes of place by the domain declaration
  )

  (:init
    ; Initial stack on peg1: bottom G, then F, E, D, C, B, A (A is top)
    (on G peg1)
    (on F G)
    (on E F)
    (on D E)
    (on C D)
    (on B C)
    (on A B)

    ; Clear facts: only the topmost objects are clear initially (peg2 and peg3 are empty and clear).
    (clear A)
    (clear peg2)
    (clear peg3)

    ; All other 'clear' facts are implicitly false until affected by moves (not listed here).

    ; Size ordering: explicit static 'smaller' relation for all pairs (transitively implied but enumerated).
    ; A is smallest, G is largest. We enumerate all strict pairs where first is smaller than second.
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G)
    (smaller C D) (smaller C E) (smaller C F) (smaller C G)
    (smaller D E) (smaller D F) (smaller D G)
    (smaller E F) (smaller E G)
    (smaller F G)
  )

  (:goal
    (and
      ; Final stack on peg3: G bottom, then F, E, D, C, B, A on top.
      (on G peg3)
      (on F G)
      (on E F)
      (on D E)
      (on C D)
      (on B C)
      (on A B)

      ; Ensure other pegs are empty at goal (explicit terminal conditions).
      (clear peg1)
      (clear peg2)

      ; Ensure topmost disk remains clear in final state (A is top on peg3).
      (clear A)
    )
  )
)