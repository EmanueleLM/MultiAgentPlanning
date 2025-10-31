; Assumptions (documented as required):
; - Both agents (vowel_agent and consonant_agent) can operate on any block.
; - The initial configuration is conservatively assumed: all blocks A..N are on the table and are clear.
; - Both agents start with empty hands.
; - The required final tower is ordered with N at the table (bottom), then M on N, L on M, ..., A on B (A is the top).
; - All natural-language preferences were treated as hard constraints; no additional temporal or preference constructs added.
; - No additional availability or capability information was invented beyond the above conservative assumptions.

(define (problem stacking-N-tower)
  (:domain blocks-multiagent)

  (:objects
    a b c d e f g h i j k l m n - block
    vowel_agent consonant_agent - agent
  )

  (:init
    ; all blocks start on the table and are clear
    (ontable a) (clear a)
    (ontable b) (clear b)
    (ontable c) (clear c)
    (ontable d) (clear d)
    (ontable e) (clear e)
    (ontable f) (clear f)
    (ontable g) (clear g)
    (ontable h) (clear h)
    (ontable i) (clear i)
    (ontable j) (clear j)
    (ontable k) (clear k)
    (ontable l) (clear l)
    (ontable m) (clear m)
    (ontable n) (clear n)

    ; both agents have empty hands initially
    (handempty vowel_agent)
    (handempty consonant_agent)
  )

  (:goal
    (and
      ; bottom block N must be on the table
      (ontable n)
      ; build the tower: M on N, L on M, ..., A on B
      (on m n)
      (on l m)
      (on k l)
      (on j k)
      (on i j)
      (on h i)
      (on g h)
      (on f g)
      (on e f)
      (on d e)
      (on c d)
      (on b c)
      (on a b)
    )
  )
)