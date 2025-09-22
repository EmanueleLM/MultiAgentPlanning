(define (problem combined-blockstack)
  (:domain combined-vowel-consonant)

  (:objects
    a b c d e f g h i j k l - block
  )

  (:init
    ;; Type classification
    (vowel a) (vowel e) (vowel i)
    (consonant b) (consonant c) (consonant d) (consonant f)
    (consonant g) (consonant h) (consonant j) (consonant k) (consonant l)

    ;; All blocks start on the table and clear (conservative starting state).
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

    ;; Both agents' hands are initially empty
    (handempty-v)
    (handempty-c)
  )

  ;; Global goal: final stack A on B on C on D on E on F on G on H on I on J on K on L on table
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
    (ontable l)
  ))
)