(define (problem vault-coop-problem)
  (:domain vault-coop-domain)

  (:objects
    BR SR k o entrance vault
  )

  (:init
    (big BR)
    (small SR)
    (at BR entrance)
    (at SR entrance)
    (has-key BR)
    (not (has-key SR))
    (vault-closed)
    (at o vault)
  )

  (:goal (and
           (vault-open)
           (has-object SR)))
)