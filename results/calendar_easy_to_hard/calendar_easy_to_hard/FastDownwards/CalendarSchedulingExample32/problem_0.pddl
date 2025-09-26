(define (problem schedule-monday-30min)
  (:domain meeting-scheduling)

  (:objects
    ; agents
    nicole christine anna terry julie abigail - agent

    ; 30-minute time slots (start times) between 09:00 and 17:00
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230
    t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - time
  )

  (:init
    ; declare all slots
    (slot t0900) (slot t0930) (slot t1000) (slot t1030)
    (slot t1100) (slot t1130) (slot t1200) (slot t1230)
    (slot t1300) (slot t1330) (slot t1400) (slot t1430)
    (slot t1500) (slot t1530) (slot t1600) (slot t1630)

    ; Anna's preference treated as hard constraint: only allow slots at or after 14:00
    (allowed t1400) (allowed t1430) (allowed t1500) (allowed t1530) (allowed t1600) (allowed t1630)

    ; initial unscheduled marker
    (unscheduled)

    ; Free slots per participant (computed by excluding their busy intervals)
    ; nicole: busy 10:00 (t1000) and 14:30 (t1430)
    (free nicole t0900) (free nicole t0930) (free nicole t1030)
    (free nicole t1100) (free nicole t1130) (free nicole t1200)
    (free nicole t1230) (free nicole t1300) (free nicole t1330)
    (free nicole t1400) (free nicole t1500) (free nicole t1530)
    (free nicole t1600) (free nicole t1630)

    ; christine: busy 11:00 (t1100) and 12:30 (t1230)
    (free christine t0900) (free christine t0930) (free christine t1000)
    (free christine t1030) (free christine t1130) (free christine t1200)
    (free christine t1300) (free christine t1330) (free christine t1400)
    (free christine t1430) (free christine t1500) (free christine t1530)
    (free christine t1600) (free christine t1630)

    ; anna: busy 09:30 (t0930),10:00 (t1000),11:00 (t1100),12:30 (t1230),15:30 (t1530),16:30 (t1630)
    ; also preference: would rather not meet before 14:00 -> encoded via allowed predicate above
    (free anna t0900) (free anna t1030) (free anna t1130) (free anna t1200)
    (free anna t1300) (free anna t1330) (free anna t1400) (free anna t1430)
    (free anna t1500) (free anna t1600)

    ; terry: busy 09:30-11:30 (t0930,t1000,t1030,t1100), busy 13:00 (t1300), busy 14:00-15:30 (t1400,t1430,t1500)
    (free terry t0900) (free terry t1130) (free terry t1200) (free terry t1230)
    (free terry t1330) (free terry t1530) (free terry t1600) (free terry t1630)

    ; julie: busy 10:00-12:00 (t1000,t1030,t1100,t1130), busy 12:30-13:30 (t1230,t1300), busy 14:00-15:00 (t1400,t1430)
    (free julie t0900) (free julie t0930) (free julie t1200) (free julie t1330)
    (free julie t1500) (free julie t1530) (free julie t1600) (free julie t1630)

    ; abigail: busy 09:00-10:00 (t0900,t0930), busy 11:30 (t1130), busy 12:30-14:00 (t1230,t1300,t1330),
    ; busy 14:30 (t1430), busy 16:30 (t1630)
    (free abigail t1000) (free abigail t1030) (free abigail t1100) (free abigail t1200)
    (free abigail t1400) (free abigail t1500) (free abigail t1530) (free abigail t1600)
  )

  ; goal: there exists a scheduled time (must satisfy Anna's hard constraint via allowed and be free for all)
  (:goal (exists (?t - time) (scheduled ?t)))
)