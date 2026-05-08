(define (problem bw-problem)
  (:domain blocks-world)
  (:objects
    yellow red blue orange - block
  )

  ;; Initial state (from modeler):
  ;; - on(red, blue)
  ;; - on(blue, orange)
  ;; - on(yellow, red)
  ;; - on-table(orange)
  ;; - clear(yellow)
  ;; - hand-empty
  ;; Note: By convention all other ground atoms not listed here are false in the initial state.
  (:init
    ;; modeler-provided ground atoms
    (on red blue)
    (on blue orange)
    (on yellow red)
    (on-table orange)
    (clear yellow)
    (hand-empty)

    ;; Auditor/modeler assumptions (not listed as facts, but documented):
    ;;   - We assume initial state respects invariants I1-I5 (unique direct support, consistency of clear/hand-empty).
    ;;   - No holding(...) atoms are true in initial state (ensured by not listing any).
  )

  ;; Goal: on(red, orange) ∧ on(blue, yellow) (from modeler)
  (:goal (and
           (on red orange)
           (on blue yellow)
         )
  )
)