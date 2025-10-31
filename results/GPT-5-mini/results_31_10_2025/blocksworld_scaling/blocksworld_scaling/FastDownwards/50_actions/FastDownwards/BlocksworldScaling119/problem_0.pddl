(define (problem blocks-multiagent-problem)
  (:domain blocks-multiagent)
  (:objects
    A E I - vowel
    B C D F G H J - consonant
  )
  (:init
    ;; all blocks start on the table and are clear
    (ontable A) (clear A)
    (ontable B) (clear B)
    (ontable C) (clear C)
    (ontable D) (clear D)
    (ontable E) (clear E)
    (ontable F) (clear F)
    (ontable G) (clear G)
    (ontable H) (clear H)
    (ontable I) (clear I)
    (ontable J) (clear J)

    ;; both agents' hands are initially empty
    (handempty-vowel)
    (handempty-consonant)
  )
  (:goal (and
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F G)
    (on G H)
    (on H I)
    (on I J)
    (ontable J)
  ))
)