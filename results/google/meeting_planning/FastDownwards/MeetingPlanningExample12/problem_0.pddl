(define (problem meet-barbara-90min)
  (:domain meet-scheduling)

  (:objects
    north-beach alamo-square - location
    visitor barbara - agent
  )

  ;; Initial time: visitor arrives at North Beach at 9:00AM = 540 minutes since midnight.
  ;; Barbara is not assumed at Alamo Square until she executes her arrival action at/after 1080.
  (:init
    (= (time) 540)
    (at-visitor north-beach)
    (not (at-barbara alamo-square))
    (not (barbara-ready))
    (not (meeting-done))
  )

  ;; Global goal: if feasible, meet Barbara for at least 90 minutes within her availability window (18:00-21:30).
  (:goal (meeting-done))

  ;; Note: The model encodes travel durations explicitly:
  ;; - North Beach -> Alamo Square: 16 minutes
  ;; - The meeting action enforces a 90-minute duration and that it starts between 18:00 (1080) and 20:00 (1200)
  ;;   so it finishes by 21:30 (1290).
)