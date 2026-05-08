(define (problem craving-problem)
  (:domain craving-domain)
  (:objects
    a b c d - object
    alpha beta - agent
  )

  (:init
    ;; Authorizations derived from agents' analyses / auditor constraints:
    ;; Only alpha is authorized to declare that a craves b.
    ;; Only beta is authorized to declare that d craves c.
    (authorized alpha a b)
    (authorized beta d c)

    ;; No cravings or recordings are present initially (these predicates are simply absent).
    ;; No 'audited' fact initially.
  )

  ;; Goal: object a craves object b AND object d craves object c.
  ;; These are required terminal conditions (no soft preferences allowed).
  (:goal (and
    (craves a b)
    (craves d c)
  ))
)