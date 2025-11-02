(define (problem blocks-problem)
  (:domain blocks)
  ;; Assumptions and resolution of ambiguous observations:
  ;; - Two different observation sets were provided. Conservatively we adopt the first observation set
  ;;   (red on blue, yellow on orange, blue and orange on table; red and yellow clear) because it
  ;;   includes an explicit goal (orange on red) and an explicit planned action sequence that achieves it.
  ;; - The alternate observation (single tall stack blue on orange on yellow on red) is not used as the
  ;;   initial state here because it contradicts the first observation. If you want that alternate
  ;;   initial state and no explicit goal, provide it explicitly and we will generate a separate problem.
  ;; - The table is represented by the constant object "table" of type place.
  ;; Agent intention (encoded as a hard goal): place orange on top of red.
  (:objects
    red blue yellow orange - block
    table - place
  )

  (:init
    ;; On relations from the chosen initial observation
    (on red blue)
    (on blue table)
    (on yellow orange)
    (on orange table)

    ;; Clear status as reported
    (clear red)
    (clear yellow)

    ;; Hand status
    (handempty)
    ;; No block is held initially: absence of (holding ...) facts

    ;; Note: We do not assert clear for blue or orange since they each have a block on top.
  )

  (:goal (and
    (on orange red)
  ))
)