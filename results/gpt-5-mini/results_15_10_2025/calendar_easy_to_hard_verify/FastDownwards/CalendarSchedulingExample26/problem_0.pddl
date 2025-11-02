; PROBLEM TEMPLATE FOR FastDownwards
; Fill in the placeholders below with the concrete day, work hours (as timeslot objects),
; each participant, their availability (free predicates), and Margaret's strict preference(s).
; Do NOT invent availability beyond what participants provide. Preference statements in natural language
; must be translated to strict constraints (for example, forbidding specific slots or requiring earliest >= X).
;
; Expected input structure you should provide for me to produce a concrete problem:
; - Objects: list of participants (including "margaret") and timeslots (each timeslot represents 30 minutes).
; - For each timeslot include a :workslot fact if it lies inside the specified work hours.
; - For each participant and timeslot include (free <participant> <timeslot>) exactly when that participant is available.
; - If Margaret's "preference" is e.g. "not before 10:00", mark all timeslots before 10:00 as not allowed for scheduling the meeting.
;   To enforce that as a strict constraint, the problem must not claim (free margaret <t>) for those forbidden slots, or
;   you must add an explicit predicate forbidding meeting-at those slots (see example comments below).
;
; After you provide actual availabilities and constraints I will instantiate this template and choose the earliest
; timeslot that satisfies all constraints (i.e., where schedule-meeting can be applied) and produce the final problem.

(define (problem schedule-meeting-instance)
  (:domain meeting-scheduling)

  (:objects
    ; Participants: replace these with the participants' names from your inputs
    ; e.g. margaret alice bob
    margaret alice bob - participant

    ; Timeslots: each object is a 30-minute block. Replace with concrete times for the specified day.
    ; Naming convention suggested: slot-0900, slot-0930, slot-1000, ... (one object per 30-minute interval in the workday)
    ; Example placeholders (replace with the actual day's slots):
    slot-0900 slot-0930 slot-1000 slot-1030 slot-1100 slot-1130 slot-1200 slot-1230 slot-1300 slot-1330 - timeslot
  )

  (:init
    ; Mark which objects are timeslots (optional, since types cover this).
    ; (timeslot slot-0900) ...

    ; Mark work hours: list all timeslots that lie inside the specified work hours.
    ; Example: if work hours are 09:00-14:00 mark the slots within that range as workslot.
    (workslot slot-0900)
    (workslot slot-0930)
    (workslot slot-1000)
    (workslot slot-1030)
    (workslot slot-1100)
    (workslot slot-1130)
    (workslot slot-1200)
    (workslot slot-1230)
    (workslot slot-1300)
    (workslot slot-1330)

    ; Define temporal ordering between consecutive 30-min slots (helpful if you extend duration >1 slot).
    (next slot-0900 slot-0930)
    (next slot-0930 slot-1000)
    (next slot-1000 slot-1030)
    (next slot-1030 slot-1100)
    (next slot-1100 slot-1130)
    (next slot-1130 slot-1200)
    (next slot-1200 slot-1230)
    (next slot-1230 slot-1300)
    (next slot-1300 slot-1330)

    ; Availabilities: list EXACTLY the (free <participant> <timeslot>) facts from participant inputs.
    ; DO NOT invent availability. For example, if Alice is available at 09:30, 10:00 and 11:30:
    ; (free alice slot-0930)
    ; (free alice slot-1000)
    ; (free alice slot-1130)
    ;
    ; Provide margaret's availabilities accordingly. If Margaret's preference is to avoid certain slots,
    ; do NOT include (free margaret <slot>) for those slots (this enforces it as a hard constraint).
    ; Example placeholders (REPLACE with actual provided availability):
    (free margaret slot-0930)
    (free margaret slot-1000)
    ; If Margaret is NOT available at 09:00 do NOT include (free margaret slot-0900).
    (free alice slot-0930)
    (free alice slot-1000)
    (free alice slot-1030)
    (free bob slot-0930)
    (free bob slot-1000)
    (free bob slot-1100)
    ; ... (fill in all provided free entries for all participants)
  )

  ; Goal: require that a meeting is scheduled at some timeslot. To force the planner to choose the earliest feasible
  ; slot, the orchestrator (me) will compute which slot is earliest that satisfies everyone's constraints and set the goal
  ; to (meeting-at <earliest-slot>). Since you have not provided the availability data yet, the goal here is left generic.
  ; Once you provide availabilities, I will produce a concrete goal that forces the earliest allowed slot.
  (:goal (exists (?t - timeslot) (meeting-at ?t)))
)