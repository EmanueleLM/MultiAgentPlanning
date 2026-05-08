(define (problem make-cravings)
  (:domain craving-domain)
  (:objects a b c d - person)

  ;; Initial facts:
  ;; Acquaintance links are explicit and enable only the allowed influence actions.
  ;; No one craves anyone initially (absence of craves facts).
  (:init
    (acquainted a b)  ;; A can influence B -> needed to make B crave A
    (acquainted d c)  ;; D can influence C -> needed to make C crave D
    (acquainted b d)  ;; B can influence D -> needed to make D crave B
  )

  ;; Goal: enforce all mandated terminal conditions explicitly.
  (:goal
    (and
      (craves b a)  ;; B craves A
      (craves c d)  ;; C craves D
      (craves d b)  ;; D craves B
    )
  )
)