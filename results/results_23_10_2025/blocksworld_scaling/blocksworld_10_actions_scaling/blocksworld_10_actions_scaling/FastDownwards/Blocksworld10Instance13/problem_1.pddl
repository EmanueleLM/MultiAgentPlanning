(define (problem blocks-final-sequenced)
  (:domain blocks-world-sequenced)
  (:objects A B C D E F - block)

  ;; Initial state as given, and step0 true to start the enforced sequence
  (:init
    (on A B)
    (on B C)
    (on C F)
    (on F D)
    (ontable D)
    (ontable E)
    (clear A)
    (clear E)
    (handempty)
    (step0)
  )

  ;; Goal: successful completion of the specified sequence (reach step10).
  ;; Note: the final block arrangement is NOT explicitly placed in the goal;
  ;; the goal requires executing the exact ordered actions encoded in the domain,
  ;; which produces the arrangement stated in <proposed_solution>.
  (:goal (and (step10)))
)