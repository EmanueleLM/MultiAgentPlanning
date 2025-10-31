(define (problem multiagent-blocks-problem-explicit)
  (:domain multiagent-blocks-explicit-sequence)

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ; Assumptions (minimal; recorded here):
  ; - The planner models multiple independent table locations by the
  ;   single predicate (ontable ?b). Any block with (ontable ?b) and
  ;   no other block on top is considered a standalone table-top stack.
  ; - The solution is encoded as a single linear, atomic sequence of
  ;   moves. To guarantee that exact valid ordering (and to enforce
  ;   agent capabilities), each move in the computed plan is represented
  ;   by a dedicated action whose preconditions and effects match the
  ;   intermediate state expected at that step.
  ; - Agents are distinguished by action name prefixes (vowel-... and
  ;   consonant-...), and capability constraints are encoded by the
  ;   (vowel ...) and (consonant ...) predicates. No other interleavings
  ;   are possible because of the step-control predicates (at-step sX).
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (:objects
    j g e d i b f h k a c - block
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 s17 s18 s19 - step
  )

  (:init
    (ontable j)
    (on g j)
    (on d g)
    (on f d)
    (on h f)
    (on a h)
    (on c a)

    (ontable e)
    (on i e)
    (on b i)
    (on k b)

    (clear c)
    (clear k)

    (vowel a)
    (vowel e)
    (vowel i)

    (consonant b)
    (consonant c)
    (consonant d)
    (consonant f)
    (consonant g)
    (consonant h)
    (consonant j)
    (consonant k)

    (at-step s0)
  )

  (:goal
    (and
      (on a b)
      (on b c)
      (on c d)
      (on d e)
      (on e f)
      (on f g)
      (on g h)
      (on h i)
      (on i j)
      (on j k)
      (ontable k)
    )
  )
)