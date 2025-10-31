; Assumptions and notes:
; - Agents: vowel_agent may perform only actions prefixed with "vowel_" and is
;   marked with the predicate (vowel-agent vowel_agent).
; - consonant_agent may perform only actions prefixed with "consonant_" and is
;   marked with the predicate (consonant-agent consonant_agent).
; - Orchestrator exists as an agent object but has no manipulation permissions.
; - The domain enforces top-of-stack (clear) and single-block pick/place rules.
; - This problem encodes the public initial stacks exactly as given and the
;   goal tower N-M-L-K-J-I-H-G-F-E-D-C-B-A with N on the table.
(define (problem stacking-N-tower)
  (:domain blocks-multiagent)

  (:objects
    a e i - vowel_block
    b c d f g h j k l m n - consonant_block
    vowel_agent consonant_agent orchestrator - agent
  )

  (:init
    ; agent role markers
    (vowel-agent vowel_agent)
    (consonant-agent consonant_agent)

    ; both manipulating agents start with empty hands
    (handempty vowel_agent)
    (handempty consonant_agent)
    (handempty orchestrator)

    ; Initial stacks (bottom-to-top):
    ; stack1: m b a g i f
    (ontable m)
    (on b m)
    (on a b)
    (on g a)
    (on i g)
    (on f i)

    ; stack2: h d j c
    (ontable h)
    (on d h)
    (on j d)
    (on c j)

    ; stack3: l e k n
    (ontable l)
    (on e l)
    (on k e)
    (on n k)

    ; clear predicates for the current tops of each stack
    (clear f)
    (clear c)
    (clear n)

    ; Non-top blocks are not declared clear (so planner must remove tops first)
    ; (other clear facts are omitted deliberately)
  )

  (:goal
    (and
      ; bottom block N must be on the table
      (ontable n)
      ; build the tower: M on N, L on M, K on L, J on K, I on J, H on I, G on H, F on G, E on F, D on E, C on D, B on C, A on B
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