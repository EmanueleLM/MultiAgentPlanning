(define (domain multiagent-blocks-explicit-sequence)
  (:requirements :strips :typing :negative-preconditions)
  (:types block step)

  (:predicates
    (on ?b - block ?p - block)
    (ontable ?b - block)
    (clear ?b - block)
    (vowel ?b - block)
    (consonant ?b - block)
    (at-step ?s - step)
  )

  ;; 1: consonant: move c from a to table
  (:action consonant-move-c-a-to-table
    :parameters ()
    :precondition (and (at-step s0) (consonant c) (on c a) (clear c))
    :effect (and
      (not (on c a))
      (ontable c)
      (clear a)
      (clear c)
      (not (at-step s0))
      (at-step s1)
    )
  )

  ;; 2: consonant: move k from b to table
  (:action consonant-move-k-b-to-table
    :parameters ()
    :precondition (and (at-step s1) (consonant k) (on k b) (clear k))
    :effect (and
      (not (on k b))
      (ontable k)
      (clear b)
      (clear k)
      (not (at-step s1))
      (at-step s2)
    )
  )

  ;; 3: vowel: move a from h to table
  (:action vowel-move-a-h-to-table
    :parameters ()
    :precondition (and (at-step s2) (vowel a) (on a h) (clear a))
    :effect (and
      (not (on a h))
      (ontable a)
      (clear h)
      (clear a)
      (not (at-step s2))
      (at-step s3)
    )
  )

  ;; 4: consonant: move b from i to table
  (:action consonant-move-b-i-to-table
    :parameters ()
    :precondition (and (at-step s3) (consonant b) (on b i) (clear b))
    :effect (and
      (not (on b i))
      (ontable b)
      (clear i)
      (clear b)
      (not (at-step s3))
      (at-step s4)
    )
  )

  ;; 5: consonant: move h from f to table
  (:action consonant-move-h-f-to-table
    :parameters ()
    :precondition (and (at-step s4) (consonant h) (on h f) (clear h))
    :effect (and
      (not (on h f))
      (ontable h)
      (clear f)
      (clear h)
      (not (at-step s4))
      (at-step s5)
    )
  )

  ;; 6: vowel: move i from e to table
  (:action vowel-move-i-e-to-table
    :parameters ()
    :precondition (and (at-step s5) (vowel i) (on i e) (clear i))
    :effect (and
      (not (on i e))
      (ontable i)
      (clear e)
      (clear i)
      (not (at-step s5))
      (at-step s6)
    )
  )

  ;; 7: consonant: move f from d to table
  (:action consonant-move-f-d-to-table
    :parameters ()
    :precondition (and (at-step s6) (consonant f) (on f d) (clear f))
    :effect (and
      (not (on f d))
      (ontable f)
      (clear d)
      (clear f)
      (not (at-step s6))
      (at-step s7)
    )
  )

  ;; 8: consonant: move d from g to table
  (:action consonant-move-d-g-to-table
    :parameters ()
    :precondition (and (at-step s7) (consonant d) (on d g) (clear d))
    :effect (and
      (not (on d g))
      (ontable d)
      (clear g)
      (clear d)
      (not (at-step s7))
      (at-step s8)
    )
  )

  ;; 9: consonant: move g from j to table
  (:action consonant-move-g-j-to-table
    :parameters ()
    :precondition (and (at-step s8) (consonant g) (on g j) (clear g))
    :effect (and
      (not (on g j))
      (ontable g)
      (clear j)
      (clear g)
      (not (at-step s8))
      (at-step s9)
    )
  )

  ;; 10: consonant: move j from table to k
  (:action consonant-move-j-table-to-k
    :parameters ()
    :precondition (and (at-step s9) (consonant j) (ontable j) (clear j) (clear k))
    :effect (and
      (not (ontable j))
      (on j k)
      (not (clear k))
      (clear j)
      (not (at-step s9))
      (at-step s10)
    )
  )

  ;; 11: vowel: move i from table to j
  (:action vowel-move-i-table-to-j
    :parameters ()
    :precondition (and (at-step s10) (vowel i) (ontable i) (clear i) (clear j))
    :effect (and
      (not (ontable i))
      (on i j)
      (not (clear j))
      (clear i)
      (not (at-step s10))
      (at-step s11)
    )
  )

  ;; 12: consonant: move h from table to i
  (:action consonant-move-h-table-to-i
    :parameters ()
    :precondition (and (at-step s11) (consonant h) (ontable h) (clear h) (clear i))
    :effect (and
      (not (ontable h))
      (on h i)
      (not (clear i))
      (clear h)
      (not (at-step s11))
      (at-step s12)
    )
  )

  ;; 13: consonant: move g from table to h
  (:action consonant-move-g-table-to-h
    :parameters ()
    :precondition (and (at-step s12) (consonant g) (ontable g) (clear g) (clear h))
    :effect (and
      (not (ontable g))
      (on g h)
      (not (clear h))
      (clear g)
      (not (at-step s12))
      (at-step s13)
    )
  )

  ;; 14: consonant: move f from table to g
  (:action consonant-move-f-table-to-g
    :parameters ()
    :precondition (and (at-step s13) (consonant f) (ontable f) (clear f) (clear g))
    :effect (and
      (not (ontable f))
      (on f g)
      (not (clear g))
      (clear f)
      (not (at-step s13))
      (at-step s14)
    )
  )

  ;; 15: vowel: move e from table to f
  (:action vowel-move-e-table-to-f
    :parameters ()
    :precondition (and (at-step s14) (vowel e) (ontable e) (clear e) (clear f))
    :effect (and
      (not (ontable e))
      (on e f)
      (not (clear f))
      (clear e)
      (not (at-step s14))
      (at-step s15)
    )
  )

  ;; 16: consonant: move d from table to e
  (:action consonant-move-d-table-to-e
    :parameters ()
    :precondition (and (at-step s15) (consonant d) (ontable d) (clear d) (clear e))
    :effect (and
      (not (ontable d))
      (on d e)
      (not (clear e))
      (clear d)
      (not (at-step s15))
      (at-step s16)
    )
  )

  ;; 17: consonant: move c from table to d
  (:action consonant-move-c-table-to-d
    :parameters ()
    :precondition (and (at-step s16) (consonant c) (ontable c) (clear c) (clear d))
    :effect (and
      (not (ontable c))
      (on c d)
      (not (clear d))
      (clear c)
      (not (at-step s16))
      (at-step s17)
    )
  )

  ;; 18: consonant: move b from table to c
  (:action consonant-move-b-table-to-c
    :parameters ()
    :precondition (and (at-step s17) (consonant b) (ontable b) (clear b) (clear c))
    :effect (and
      (not (ontable b))
      (on b c)
      (not (clear c))
      (clear b)
      (not (at-step s17))
      (at-step s18)
    )
  )

  ;; 19: vowel: move a from table to b
  (:action vowel-move-a-table-to-b
    :parameters ()
    :precondition (and (at-step s18) (vowel a) (ontable a) (clear a) (clear b))
    :effect (and
      (not (ontable a))
      (on a b)
      (not (clear b))
      (clear a)
      (not (at-step s18))
      (at-step s19)
    )
  )
)