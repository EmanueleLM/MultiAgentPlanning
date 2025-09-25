(define (problem meeting-problem)
  (:domain meeting-domain)

  (:objects
    you john - agent
    richmond north-beach - location
  )

  ;; No instantaneous initial locations assumed except via timed initial literals below
  (:init
    ;; Timed initial literals encode known arrival/availability windows in minutes from midnight.
    ;; You arrive at Richmond District at 09:00 (540 minutes).
    (at 540 (at you richmond))

    ;; John is at North Beach from 15:15 (915) to 17:15 (1035).
    (at 915 (at john north-beach))
    (at 1035 (not (at john north-beach)))
  )

  ;; Goal: achieve a meeting that lasts at least 75 minutes (enforced by meet action duration).
  (:goal (met))

  ;; Optimize makespan (minimize total time when plan finishes).
  (:metric minimize (total-time))
)