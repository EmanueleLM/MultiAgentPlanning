(define (problem make-cravings)
  (:domain craving-domain)
  (:objects a b c d - object)

  ;; All original initial facts are produced by the domain's `initialize` action.
  ;; Keep the :init block minimal (no positive predicate instances here).
  (:init
  )

  (:goal
    (and
      (craves b a)  ;; b craves a
      (craves c d)  ;; c craves d
      (craves d b)  ;; d craves b
    )
  )
)