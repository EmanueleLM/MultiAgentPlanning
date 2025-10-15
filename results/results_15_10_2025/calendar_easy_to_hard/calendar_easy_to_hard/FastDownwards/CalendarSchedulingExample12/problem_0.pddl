(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)

  ;; Objects: four named participants and discrete 30-minute time slots starting at 09:00
  ;; and ending with the slot that starts at 16:30 (which covers 16:30-17:00).
  ;; A 60-minute meeting occupies two consecutive slots; allowed start times are 09:00..16:00.
  (:objects
    Dylan Kathryn Hannah Anna - person
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230
    t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - time
  )

  (:init
    ;; declare the persons and times
    (person Dylan) (person Kathryn) (person Hannah) (person Anna)
    (time t0900) (time t0930) (time t1000) (time t1030)
    (time t1100) (time t1130) (time t1200) (time t1230)
    (time t1300) (time t1330) (time t1400) (time t1430)
    (time t1500) (time t1530) (time t1600) (time t1630)

    ;; consecutive relations for 30-minute steps
    (next t0900 t0930) (next t0930 t1000) (next t1000 t1030) (next t1030 t1100)
    (next t1100 t1130) (next t1130 t1200) (next t1200 t1230) (next t1230 t1300)
    (next t1300 t1330) (next t1330 t1400) (next t1400 t1430) (next t1430 t1500)
    (next t1500 t1530) (next t1530 t1600) (next t1600 t1630)

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ; IMPORTANT: The busy intervals you provide must be treated as hard constraints.
    ; Do NOT invent availability. For FastDownward the initial state must explicitly
    ; list which (free <person> <time>) facts hold. That means you must add a
    ; (free ...) fact for every 30-minute slot that is NOT within that participant's
    ; busy intervals. Do NOT add (free ...) for slots that lie inside a busy interval.
    ;
    ; Example (do NOT use unless these reflect the actual provided busy intervals):
    ;  If Dylan is busy 09:30-10:30, then do NOT include
    ;    (free Dylan t0930) nor (free Dylan t1000)
    ;  but you would include (free Dylan t0900), (free Dylan t1030), etc., if those
    ;  slots are not busy for Dylan.
    ;
    ; Please provide the machine-readable busy intervals for each participant (Dylan,
    ; Kathryn, Hannah, Anna). Once you provide those, I will generate the exact
    ; list of (free ...) facts for every person/time slot and produce a fully
    ; grounded problem that FastDownward can solve.
    ;
    ; For convenience, below is an empty placeholder. Replace or augment it with
    ; concrete (free ...) facts derived from the provided busy intervals:
    ;
    ; Example placeholder: (UNCOMMENT AND EDIT when you supply busy intervals)
    ;
    ;  ;; Dylan's free slots (example)
    ;  (free Dylan t0900) (free Dylan t0930) ... 
    ;
    ;  ;; Kathryn's free slots (example)
    ;  (free Kathryn t0900) ...
    ;
    ;  ;; Hannah's free slots (example)
    ;  (free Hannah t0900) ...
    ;
    ;  ;; Anna's free slots (example)
    ;  (free Anna t0900) ...
    ;
    ; End of placeholder.
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  )

  ;; Goal: schedule the meeting at some allowed start time between 09:00 and 16:00 (inclusive).
  ;; The planner will return a plan containing the single schedule-meeting action with the
  ;; chosen start time. Because this problem formulation accepts any feasible start time,
  ;; to enforce "earliest possible" deterministically we will ground the problem (i.e.,
  ;; populate free facts from your busy intervals) and then I can produce a version
  ;; whose goal is the earliest feasible slot only. If you want me to do that automatically,
  ;; provide the busy intervals and I will produce that grounded problem and set the goal
  ;; to the earliest available time.
  (:goal
    (or
      (meeting-scheduled t0900) (meeting-scheduled t0930) (meeting-scheduled t1000)
      (meeting-scheduled t1030) (meeting-scheduled t1100) (meeting-scheduled t1130)
      (meeting-scheduled t1200) (meeting-scheduled t1230) (meeting-scheduled t1300)
      (meeting-scheduled t1330) (meeting-scheduled t1400) (meeting-scheduled t1430)
      (meeting-scheduled t1500) (meeting-scheduled t1530) (meeting-scheduled t1600)
    )
  )
)