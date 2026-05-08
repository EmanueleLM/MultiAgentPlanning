(define (problem meeting-planning-strips-0)
  (:domain meeting-planning-strips)
  (:objects
    traveler - agent
    stephanie - agent
    marina mission - location
    t0 t20 t90 t110 t210 t270 t_final - time-point
  )
  (:init
    (= (total-cost) 0)
    (at traveler marina)
    (is-traveler traveler)
    (is-stephanie stephanie)

    ; Initial time
    (current-time t0)

    ; Define time point ordering (pre-computed based on minutes)
    (time-point-precedes t0 t20)
    (time-point-precedes t0 t90)
    (time-point-precedes t0 t110)
    (time-point-precedes t0 t210)
    (time-point-precedes t0 t270)
    (time-point-precedes t0 t_final)

    (time-point-precedes t20 t90)
    (time-point-precedes t20 t110)
    (time-point-precedes t20 t210)
    (time-point-precedes t20 t270)
    (time-point-precedes t20 t_final)

    (time-point-precedes t90 t110)
    (time-point-precedes t90 t210)
    (time-point-precedes t90 t270)
    (time-point-precedes t90 t_final)

    (time-point-precedes t110 t210)
    (time-point-precedes t110 t270)
    (time-point-precedes t110 t_final)

    (time-point-precedes t210 t270)
    (time-point-precedes t210 t_final)

    (time-point-precedes t270 t_final)

    ; Pre-computed duration for travel (exactly 20 minutes)
    (duration-equals-20min t0 t20)
    (duration-equals-20min t90 t110)

    ; Pre-computed duration for meeting (>= 120 minutes)
    ; (start_tp, end_tp) pairs where end_tp - start_tp >= 120
    (duration-ge-120min t90 t210)   ; 210 - 90 = 120 min
    (duration-ge-120min t90 t270)   ; 270 - 90 = 180 min
    (duration-ge-120min t110 t270)  ; 270 - 110 = 160 min

    ; Stephanie's availability (from 90 minutes to 270 minutes, inclusive of 270)
    (stephanie-available-at-time t90)
    (stephanie-available-at-time t110)
    (stephanie-available-at-time t210)
    (stephanie-available-at-time t270) ; Added: Stephanie is available at t270 (1:30 PM)

    ; Stephanie's continuous availability throughout an interval
    ; (start_tp, end_tp) pairs where start_tp >= 90 AND end_tp <= 270
    (stephanie-available-throughout t90 t110)
    (stephanie-available-throughout t90 t210)
    (stephanie-available-throughout t110 t210)
    (stephanie-available-throughout t90 t270)   ; Added: 90 to 270 is a valid continuous availability
    (stephanie-available-throughout t110 t270)  ; Added: 110 to 270 is a valid continuous availability

  )
  (:goal
    (meeting-occurred traveler stephanie)
  )
  (:metric minimize (total-cost))
)