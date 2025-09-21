(define (problem schedule-monday-integrated)
  (:domain integrated-scheduling)

  ;; Objects: canonical half-hour slots Monday 09:00-16:30, persons and one meeting.
  (:objects
    slot-0900 slot-0930 slot-1000 slot-1030 slot-1100 slot-1130
    slot-1200 slot-1230 slot-1300 slot-1330 slot-1400 slot-1430
    slot-1500 slot-1530 slot-1600 slot-1630 - slot

    joyce christine alexander - person
    m1 - meeting
  )

  (:init
    ;; Declare meeting and slots
    (meeting m1)

    (slot slot-0900) (slot slot-0930) (slot slot-1000) (slot slot-1030)
    (slot slot-1100) (slot slot-1130) (slot slot-1200) (slot slot-1230)
    (slot slot-1300) (slot slot-1330) (slot slot-1400) (slot slot-1430)
    (slot slot-1500) (slot slot-1530) (slot slot-1600) (slot slot-1630)

    ;; Initially all slots are presumed available for scheduling (will be consumed on confirm)
    (slot-available slot-0900) (slot-available slot-0930) (slot-available slot-1000)
    (slot-available slot-1030) (slot-available slot-1100) (slot-available slot-1130)
    (slot-available slot-1200) (slot-available slot-1230) (slot-available slot-1300)
    (slot-available slot-1330) (slot-available slot-1400) (slot-available slot-1430)
    (slot-available slot-1500) (slot-available slot-1530) (slot-available slot-1600)
    (slot-available slot-1630)

    ;; Attendance as in Joyce's model: these are the meeting participants
    (attends joyce m1)
    (attends christine m1)
    (attends alexander m1)

    ;; ---------- Integrated availability knowledge ----------
    ;; We integrate each agent's provided information, preserving agent-specific facts.
    ;; Where agents provided conflicting facts, we keep each agent's own assertions (no cross-agent overwrites)
    ;; and rely on the confirmation step to require agreement.

    ;; Joyce's known free slots (from agent 1). Mapping s1..s16 -> canonical times:
    ;; s1=09:00, s2=09:30, s3=10:00, s4=10:30, s5=11:00 (busy), s6=11:30, s7=12:00, s8=12:30,
    ;; s9=13:00, s10=13:30 (busy), s11=14:00, s12=14:30 (busy), s13=15:00 (busy), s14=15:30 (busy),
    ;; s15=16:00 (busy), s16=16:30
    (free-joyce slot-0900) (free-joyce slot-0930) (free-joyce slot-1000) (free-joyce slot-1030)
    ;; slot-1100 omitted (Joyce busy)
    (free-joyce slot-1130) (free-joyce slot-1200) (free-joyce slot-1230) (free-joyce slot-1300)
    ;; slot-1330 omitted (Joyce busy)
    (free-joyce slot-1400)
    ;; slot-1430, slot-1500, slot-1530, slot-1600 omitted (Joyce busy)
    (free-joyce slot-1630)

    ;; Christine's own knowledge (agent 2): cannot meet before 12:00; free from 12:00 onward.
    ;; We adopt Christine's self-reported availability as authoritative for Christine.
    (free-christine slot-1200) (free-christine slot-1230) (free-christine slot-1300)
    (free-christine slot-1330) (free-christine slot-1400) (free-christine slot-1430)
    (free-christine slot-1500) (free-christine slot-1530) (free-christine slot-1600)
    (free-christine slot-1630)

    ;; Alexander's own knowledge (agent 3): explicit busy intervals converted to free slots that remain.
    ;; Agent 3 provided explicit free slots: 11:00, 11:30, 12:30, 13:00, 15:00, 16:00
    (free-alexander slot-1100) (free-alexander slot-1130) (free-alexander slot-1230)
    (free-alexander slot-1300) (free-alexander slot-1500) (free-alexander slot-1600)

    ;; Note: Agent 2's public statement asserted a common free slot at 12:00.
    ;; Agent 3 (Alexander) explicitly marked 12:00 busy. To avoid inconsistency we preserve each agent's own facts:
    ;; - Christine is free at 12:00 (per Christine)
    ;; - Joyce is also free at 12:00 (per Joyce)
    ;; - Alexander does not assert free at 12:00 (and his own model marks 12:00 busy), so Alexander will not acknowledge 12:00.
    ;; Therefore the final confirmation requires ack from all three agents and will only succeed for slots all three have free assertions for.

    ;; -----------------------------------------------------
  )

  ;; Goal: find a slot and confirm the meeting where all three agents have acknowledged the same slot.
  (:goal (meeting-confirmed m1))
)