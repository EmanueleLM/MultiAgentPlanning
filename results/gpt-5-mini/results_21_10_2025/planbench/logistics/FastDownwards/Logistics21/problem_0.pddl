(define (problem scenario1)
  (:domain orchestration)
  (:objects
    a b - agent
    coin1 clip1 - item
    cup1 - container
    obj1 - obj
  )
  (:init
    ;; agent a holds a small coin and a clip; coin is small
    (has_item a coin1)
    (has_item a clip1)
    (item_small coin1)

    ;; agent a has a container with liquid and is thirsty
    (has_container a cup1)
    (contains_liquid cup1)
    (not (empty cup1))
    (thirsty a)

    ;; object initial status
    (not (clipped obj1))
    (not (wretched obj1))
    ;; no remembered facts initially
    ;; no tightfisted agents initially
  )
  (:goal (and
           ;; require agent b to receive the small coin (paltry_a)
           (has_item b coin1)
           ;; require agent a to no longer be thirsty (sip_a)
           (not (thirsty a))
           ;; require obj1 to be clipped by agent a (clip_a)
           (clipped obj1)
         ))
)