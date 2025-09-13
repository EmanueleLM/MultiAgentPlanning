(define (problem schedule-meeting-on-monday)
  (:domain unified-meeting-scheduler)
  
  (:objects
    diane deborah - person
    monday-9:30-10:00 monday-10:00-10:30 monday-10:30-11:00
    monday-11:00-11:30 monday-11:30-12:00 monday-12:30-13:00
    monday-13:00-13:30 monday-13:30-14:00 monday-14:00-14:30
    monday-15:30-16:00 monday-16:00-16:30 monday-16:30-17:00 - time-slot
  )

  (:init
    (busy diane monday-9:00-9:30)
    (busy diane monday-12:00-12:30)
    (busy diane monday-14:30-15:30)
    (available deborah monday-9:30-10:00)
    (available deborah monday-10:00-10:30)
    (available deborah monday-10:30-11:00)
    (available deborah monday-11:00-11:30)
    (available deborah monday-11:30-12:00)
    (available deborah monday-12:30-13:00)
    (available deborah monday-13:00-13:30)
    (available deborah monday-13:30-14:00)
    (available deborah monday-14:00-14:30)
    (available deborah monday-15:30-16:00)
    (available deborah monday-16:00-16:30)
    (available deborah monday-16:30-17:00)

    (check-availability diane monday-9:30-10:00)
    (check-availability diane monday-10:00-10:30)
    (check-availability diane monday-10:30-11:00)
    (check-availability diane monday-11:00-11:30)
    (check-availability diane monday-11:30-12:00)
    (check-availability diane monday-12:30-13:00)
    (check-availability diane monday-13:00-13:30)
    (check-availability diane monday-13:30-14:00)
    (check-availability diane monday-14:00-14:30)
    (check-availability diane monday-15:30-16:00)
    (check-availability diane monday-16:00-16:30)
    (check-availability diane monday-16:30-17:00)
  )

  (:goal
    (exists (?t - time-slot) (meeting-scheduled ?t))
  )
)