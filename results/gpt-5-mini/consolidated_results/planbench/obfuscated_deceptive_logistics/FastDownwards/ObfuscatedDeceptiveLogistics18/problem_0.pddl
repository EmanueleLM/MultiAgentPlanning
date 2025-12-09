(define (problem linking-problem)
  (:domain linking-domain)
  (:objects
    worker - agent
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 object_10 object_11 - obj
  )

  ;; Normalized initial facts:
  ;; - The agent is available.
  ;; - No (next ...), (has-next ...) or (has-prev ...) facts are present to begin with,
  ;;   enforcing that all objects are initially unlinked on both sides.
  (:init
    (available-agent worker)
  )

  ;; Goal: enforce the required terminal condition explicitly.
  ;; The plan must achieve (next object_11 object_10).
  (:goal (and
           (next object_11 object_10)
         ))
)