(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)

  ;; Agents and 30-minute slots from 09:00 to 16:30 (inclusive).
  ;; Slot naming convention: sHH_MM corresponds to HH:MM - HH:MM+30min
  (:objects
    adam jerry matthew - agent
    s09_00 s09_30 s10_00 s10_30 s11_00 s11_30 s12_00 s12_30
    s13_00 s13_30 s14_00 s14_30 s15_00 s15_30 s16_00 s16_30 - slot
  )

  (:init
    ;; Declare agents and slots
    (agent adam) (agent jerry) (agent matthew)
    (slot s09_00) (slot s09_30) (slot s10_00) (slot s10_30)
    (slot s11_00) (slot s11_30) (slot s12_00) (slot s12_30)
    (slot s13_00) (slot s13_30) (slot s14_00) (slot s14_30)
    (slot s15_00) (slot s15_30) (slot s16_00) (slot s16_30)

    ;; Public information (implicitly represented by available slot set and problem constraints):
    ;; - Meeting duration: 30 minutes (slots represent 30-minute blocks)
    ;; - Day: Monday
    ;; - Work hours: 09:00-17:00 (slots cover the range)
    ;; The busy intervals below come from each agent's private information.
    ;; We encode free slots (not busy) for each agent based only on the provided private info.

    ;; ADAM's private busy: 10:00-10:30 (s10_00), 12:30-13:00 (s12_30), 13:30-14:30 (s13_30 and s14_00)
    ;; Therefore Adam is free at all other listed slots:
    (free adam s09_00) (free adam s09_30) (free adam s10_30)
    (free adam s11_00) (free adam s11_30) (free adam s12_00)
    (free adam s13_00)
    (free adam s14_30) (free adam s15_00) (free adam s15_30)
    (free adam s16_00) (free adam s16_30)

    ;; JERRY's private busy: 09:00-09:30 (s09_00), 12:00-12:30 (s12_00), 15:00-16:00 (s15_00, s15_30)
    ;; Therefore Jerry is free at:
    (free jerry s09_30) (free jerry s10_00) (free jerry s10_30)
    (free jerry s11_00) (free jerry s11_30) (free jerry s12_30)
    (free jerry s13_00) (free jerry s13_30) (free jerry s14_00)
    (free jerry s14_30) (free jerry s16_00) (free jerry s16_30)

    ;; MATTHEW's private busy:
    ;; 09:30-11:00 (s09_30, s10_00, s10_30),
    ;; 11:30-12:30 (s11_30, s12_00),
    ;; 13:00-14:00 (s13_00, s13_30),
    ;; 14:30-17:00 (s14_30, s15_00, s15_30, s16_00, s16_30)
    ;; Therefore Matthew is free at:
    (free matthew s09_00) (free matthew s11_00) (free matthew s12_30) (free matthew s14_00)
  )

  ;; Goal: schedule the 30-minute meeting (i.e., some slot is scheduled) where all three agents must agree.
  ;; We use an existential goal: there exists some slot that becomes scheduled.
  (:goal (exists (?s - slot) (scheduled ?s)))
)