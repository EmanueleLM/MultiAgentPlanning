(define (problem schedule-monday)
  (:domain meeting-scheduling)
  (:objects
    Katherine Nicole Kevin - person
    slot-09-00 slot-09-30 slot-10-00 slot-10-30 slot-11-00 slot-11-30
    slot-12-00 slot-12-30 slot-13-00 slot-13-30 slot-14-00 slot-14-30
    slot-15-00 slot-15-30 slot-16-00 slot-16-30 - slot
  )

  (:init
    ;; adjacency of half-hour slots (start -> next half-hour)
    (next slot-09-00 slot-09-30)
    (next slot-09-30 slot-10-00)
    (next slot-10-00 slot-10-30)
    (next slot-10-30 slot-11-00)
    (next slot-11-00 slot-11-30)
    (next slot-11-30 slot-12-00)
    (next slot-12-00 slot-12-30)
    (next slot-12-30 slot-13-00)
    (next slot-13-00 slot-13-30)
    (next slot-13-30 slot-14-00)
    (next slot-14-00 slot-14-30)
    (next slot-14-30 slot-15-00)
    (next slot-15-00 slot-15-30)
    (next slot-15-30 slot-16-00)
    (next slot-16-00 slot-16-30)

    ;; Katherine: available 09:00-17:00 -> free for all half-hour slots 09:00..16:30
    (free Katherine slot-09-00) (free Katherine slot-09-30) (free Katherine slot-10-00) (free Katherine slot-10-30)
    (free Katherine slot-11-00) (free Katherine slot-11-30) (free Katherine slot-12-00) (free Katherine slot-12-30)
    (free Katherine slot-13-00) (free Katherine slot-13-30) (free Katherine slot-14-00) (free Katherine slot-14-30)
    (free Katherine slot-15-00) (free Katherine slot-15-30) (free Katherine slot-16-00) (free Katherine slot-16-30)

    ;; Nicole: available 09:00-17:00 -> free for all half-hour slots 09:00..16:30
    (free Nicole slot-09-00) (free Nicole slot-09-30) (free Nicole slot-10-00) (free Nicole slot-10-30)
    (free Nicole slot-11-00) (free Nicole slot-11-30) (free Nicole slot-12-00) (free Nicole slot-12-30)
    (free Nicole slot-13-00) (free Nicole slot-13-30) (free Nicole slot-14-00) (free Nicole slot-14-30)
    (free Nicole slot-15-00) (free Nicole slot-15-30) (free Nicole slot-16-00) (free Nicole slot-16-30)

    ;; Kevin: baseline available 09:00-17:00 except busy intervals:
    ;; busy 10:00-10:30 -> slot-10-00 busy
    ;; busy 11:30-12:00 -> slot-11-30 busy
    ;; busy 15:30-16:30 -> slots 15:30 and 16:00 busy
    ;; So mark free for other slots
    (free Kevin slot-09-00) (free Kevin slot-09-30)
    ;; slot-10-00 is busy -> not listed as free
    (free Kevin slot-10-30)
    (free Kevin slot-11-00)
    ;; slot-11-30 is busy -> not listed as free
    (free Kevin slot-12-00) (free Kevin slot-12-30)
    (free Kevin slot-13-00) (free Kevin slot-13-30)
    (free Kevin slot-14-00) (free Kevin slot-14-30)
    (free Kevin slot-15-00)
    ;; slot-15-30 busy, slot-16-00 busy -> not listed as free
    (free Kevin slot-16-30)
  )

  (:goal
    (meeting-scheduled)
  )
)