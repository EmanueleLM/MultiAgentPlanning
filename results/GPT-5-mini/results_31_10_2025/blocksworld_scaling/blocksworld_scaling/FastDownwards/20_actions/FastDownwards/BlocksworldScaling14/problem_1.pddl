; Assumptions/notes:
; - There is a single abstract "table" represented by the predicate (ontable ?x).
;   The table can host many stacks (no 'clear' required on the table).
; - Agents are modelled implicitly by action names: vowel-* actions can only
;   move A, E, I (they require (vowel ?x)), consonant-* actions can only
;   move the consonants listed (they require (consonant ?x)).
; - The action schemas enforce that only top blocks can be moved (via (clear ?x))
;   and that the destination block must be clear for block-to-block moves.

(define (problem BlocksworldScaling14-instance)
  (:domain blocksworld-vowel-consonant)

  (:objects
    a b c d e f g h i j k l m n - block
  )

  (:init
    ; vowel / consonant classification
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
    (consonant l)
    (consonant m)
    (consonant n)

    ; Initial stack relations (from the human specification):
    ; Stack 1 (bottom to top): a d i b n m g l j
    (ontable a)
    (on d a)
    (on i d)
    (on b i)
    (on n b)
    (on m n)
    (on g m)
    (on l g)
    (on j l)

    ; Stack 2 (bottom to top): f e k c h
    (ontable f)
    (on e f)
    (on k e)
    (on c k)
    (on h c)

    ; Clear predicates: only the top blocks are clear initially
    (clear j)
    (clear h)

    ; Blocks on bottom that are on the table but not covered are not all clear;
    ; e.g., a and f currently have blocks on them, so they are not marked clear.
    ; Other clear statuses will be inferred/managed by the actions' effects.
  )

  (:goal (and
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
    (on k l)
    (on l m)
    (on m n)
    (ontable n)
  ))
)