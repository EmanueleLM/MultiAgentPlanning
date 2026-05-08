(define (problem craving-problem)
  (:domain craving-domain)
  (:objects a b c - ag)

  (:init
    ;; No 'offered' or 'craves' facts are true initially.
    ;; (FastDownwards reads only positive facts in :init; absence enforces negation where used.)
  )

  (:goal (and
    (craves a c)
    (craves b a)
  ))
)