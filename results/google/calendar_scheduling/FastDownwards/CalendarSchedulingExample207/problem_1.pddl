(define (problem schedule-meeting)
  (:domain meeting-scheduling)
  (:objects
    walter danielle julia samuel lori - person
    slot-09-00 slot-09-30 slot-10-00 slot-10-30 slot-11-00 slot-11-30 slot-12-00 slot-12-30
    slot-13-00 slot-13-30 slot-14-00 slot-14-30 slot-15-00 slot-15-30 slot-16-00 slot-16-30 - slot
  )
  (:init
    (person walter) (person danielle) (person julia) (person samuel) (person lori)
    (slot slot-09-00) (slot slot-09-30) (slot slot-10-00) (slot slot-10-30)
    (slot slot-11-00) (slot slot-11-30) (slot slot-12-00) (slot slot-12-30)
    (slot slot-13-00) (slot slot-13-30) (slot slot-14-00) (slot slot-14-30)
    (slot slot-15-00) (slot slot-15-30) (slot slot-16-00) (slot slot-16-30)

    (before slot-09-00 slot-09-30) (before slot-09-00 slot-10-00) (before slot-09-00 slot-10-30)
    (before slot-09-00 slot-11-00) (before slot-09-00 slot-11-30) (before slot-09-00 slot-12-00)
    (before slot-09-00 slot-12-30) (before slot-09-00 slot-13-00) (before slot-09-00 slot-13-30)
    (before slot-09-00 slot-14-00) (before slot-09-00 slot-14-30) (before slot-09-00 slot-15-00)
    (before slot-09-00 slot-15-30) (before slot-09-00 slot-16-00) (before slot-09-00 slot-16-30)

    (before slot-09-30 slot-10-00) (before slot-09-30 slot-10-30) (before slot-09-30 slot-11-00)
    (before slot-09-30 slot-11-30) (before slot-09-30 slot-12-00) (before slot-09-30 slot-12-30)
    (before slot-09-30 slot-13-00) (before slot-09-30 slot-13-30) (before slot-09-30 slot-14-00)
    (before slot-09-30 slot-14-30) (before slot-09-30 slot-15-00) (before slot-09-30 slot-15-30)
    (before slot-09-30 slot-16-00) (before slot-09-30 slot-16-30)

    (before slot-10-00 slot-10-30) (before slot-10-00 slot-11-00) (before slot-10-00 slot-11-30)
    (before slot-10-00 slot-12-00) (before slot-10-00 slot-12-30) (before slot-10-00 slot-13-00)
    (before slot-10-00 slot-13-30) (before slot-10-00 slot-14-00) (before slot-10-00 slot-14-30)
    (before slot-10-00 slot-15-00) (before slot-10-00 slot-15-30) (before slot-10-00 slot-16-00)
    (before slot-10-00 slot-16-30)

    (before slot-10-30 slot-11-00) (before slot-10-30 slot-11-30) (before slot-10-30 slot-12-00)
    (before slot-10-30 slot-12-30) (before slot-10-30 slot-13-00) (before slot-10-30 slot-13-30)
    (before slot-10-30 slot-14-00) (before slot-10-30 slot-14-30) (before slot-10-30 slot-15-00)
    (before slot-10-30 slot-15-30) (before slot-10-30 slot-16-00) (before slot-10-30 slot-16-30)

    (before slot-11-00 slot-11-30) (before slot-11-00 slot-12-00) (before slot-11-00 slot-12-30)
    (before slot-11-00 slot-13-00) (before slot-11-00 slot-13-30) (before slot-11-00 slot-14-00)
    (before slot-11-00 slot-14-30) (before slot-11-00 slot-15-00) (before slot-11-00 slot-15-30)
    (before slot-11-00 slot-16-00) (before slot-11-00 slot-16-30)

    (before slot-11-30 slot-12-00) (before slot-11-30 slot-12-30) (before slot-11-30 slot-13-00)
    (before slot-11-30 slot-13-30) (before slot-11-30 slot-14-00) (before slot-11-30 slot-14-30)
    (before slot-11-30 slot-15-00) (before slot-11-30 slot-15-30) (before slot-11-30 slot-16-00)
    (before slot-11-30 slot-16-30)

    (before slot-12-00 slot-12-30) (before slot-12-00 slot-13-00) (before slot-12-00 slot-13-30)
    (before slot-12-00 slot-14-00) (before slot-12-00 slot-14-30) (before slot-12-00 slot-15-00)
    (before slot-12-00 slot-15-30) (before slot-12-00 slot-16-00) (before slot-12-00 slot-16-30)

    (before slot-12-30 slot-13-00) (before slot-12-30 slot-13-30) (before slot-12-30 slot-14-00)
    (before slot-12-30 slot-14-30) (before slot-12-30 slot-15-00) (before slot-12-30 slot-15-30)
    (before slot-12-30 slot-16-00) (before slot-12-30 slot-16-30)

    (before slot-13-00 slot-13-30) (before slot-13-00 slot-14-00) (before slot-13-00 slot-14-30)
    (before slot-13-00 slot-15-00) (before slot-13-00 slot-15-30) (before slot-13-00 slot-16-00)
    (before slot-13-00 slot-16-30)

    (before slot-13-30 slot-14-00) (before slot-13-30 slot-14-30) (before slot-13-30 slot-15-00)
    (before slot-13-30 slot-15-30) (before slot-13-30 slot-16-00) (before slot-13-30 slot-16-30)

    (before slot-14-00 slot-14-30) (before slot-14-00 slot-15-00) (before slot-14-00 slot-15-30)
    (before slot-14-00 slot-16-00) (before slot-14-00 slot-16-30)

    (before slot-14-30 slot-15-00) (before slot-14-30 slot-15-30) (before slot-14-30 slot-16-00)
    (before slot-14-30 slot-16-30)

    (before slot-15-00 slot-15-30) (before slot-15-00 slot-16-00) (before slot-15-00 slot-16-30)

    (before slot-15-30 slot-16-00) (before slot-15-30 slot-16-30)

    (before slot-16-00 slot-16-30)

    (= (total-cost) 0)

    ;; availabilities computed from participants' private calendars
    ;; Walter: free all slots
    (free walter slot-09-00) (free walter slot-09-30) (free walter slot-10-00) (free walter slot-10-30)
    (free walter slot-11-00) (free walter slot-11-30) (free walter slot-12-00) (free walter slot-12-30)
    (free walter slot-13-00) (free walter slot-13-30) (free walter slot-14-00) (free walter slot-14-30)
    (free walter slot-15-00) (free walter slot-15-30) (free walter slot-16-00) (free walter slot-16-30)

    ;; Danielle: free all slots
    (free danielle slot-09-00) (free danielle slot-09-30) (free danielle slot-10-00) (free danielle slot-10-30)
    (free danielle slot-11-00) (free danielle slot-11-30) (free danielle slot-12-00) (free danielle slot-12-30)
    (free danielle slot-13-00) (free danielle slot-13-30) (free danielle slot-14-00) (free danielle slot-14-30)
    (free danielle slot-15-00) (free danielle slot-15-30) (free danielle slot-16-00) (free danielle slot-16-30)

    ;; Julia: busy at 09:30,10:30,13:30,16:00 -> free otherwise
    (free julia slot-09-00) (free julia slot-10-00) (free julia slot-11-00) (free julia slot-11-30)
    (free julia slot-12-00) (free julia slot-12-30) (free julia slot-13-00) (free julia slot-14-00)
    (free julia slot-14-30) (free julia slot-15-00) (free julia slot-15-30) (free julia slot-16-30)

    ;; Samuel: busy 09:00-11:00,11:30-12:30,13:00-14:30,15:00-15:30,16:00-17:00 -> free at 11:00,12:30,14:30
    (free samuel slot-11-00) (free samuel slot-12-30) (free samuel slot-14-30)

    ;; Lori: busy 10:00-10:30,11:00-11:30,12:00-12:30,13:00-14:30,15:00-17:00 -> free at 09:00,09:30,10:30,11:30,12:30,14:30
    (free lori slot-09-00) (free lori slot-09-30) (free lori slot-10-30) (free lori slot-11-30)
    (free lori slot-12-30) (free lori slot-14-30)
  )
  (:goal (exists (?s - slot) (chosen ?s)))
  (:metric minimize (total-cost))
)