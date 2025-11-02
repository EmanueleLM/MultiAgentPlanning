(define (domain blocks-vowel-consonant)
  (:requirements :strips :typing)
  (:types block)
  (:predicates
    (on ?x - block ?y - block)    ; ?x directly on ?y
    (ontable ?x - block)          ; ?x is on the table
    (clear ?x - block)            ; nothing on ?x
  )

  ;; Consonant moves enumerated from the reported local capability.
  ;; These actions are concrete and correspond exactly to the currently available single-block moves.
  ;; No vowel-move actions are included because the vowel agent reported no legal moves at this moment.

  (:action consonant-move-1    ; move K from A to table
    :precondition (and (on K A) (clear K))
    :effect (and
      (ontable K)
      (not (on K A))
      (clear A)
      (clear K)
    )
  )

  (:action consonant-move-2    ; move K from A onto F
    :precondition (and (on K A) (clear K) (clear F))
    :effect (and
      (on K F)
      (not (on K A))
      (clear A)
      (not (clear F))
      (clear K)
    )
  )

  (:action consonant-move-3    ; move F from E to table
    :precondition (and (on F E) (clear F))
    :effect (and
      (ontable F)
      (not (on F E))
      (clear E)
      (clear F)
    )
  )

  (:action consonant-move-4    ; move F from E onto K
    :precondition (and (on F E) (clear F) (clear K))
    :effect (and
      (on F K)
      (not (on F E))
      (clear E)
      (not (clear K))
      (clear F)
    )
  )
)