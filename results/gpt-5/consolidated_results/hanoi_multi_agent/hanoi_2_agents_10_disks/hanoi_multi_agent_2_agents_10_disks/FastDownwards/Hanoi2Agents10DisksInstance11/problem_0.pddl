(define (problem hanoi_two_agent_ordered_instance)
  (:domain hanoi_two_agent_ordered)
  (:objects
    left middle right - peg
    A B C D E F G H I J - disk
    agent_1 agent_2 - agent
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 s17 s18 s19 s20 s21 s22 - step
  )
  (:init
    ; Type markers (static)
    (peg left) (peg middle) (peg right)
    (disk A) (disk B) (disk C) (disk D) (disk E) (disk F) (disk G) (disk H) (disk I) (disk J)
    (agent agent_1) (agent agent_2)

    ; Ownership
    (belongs A agent_1)
    (belongs B agent_1)
    (belongs C agent_1)
    (belongs D agent_1)
    (belongs E agent_1)
    (belongs F agent_2)
    (belongs G agent_2)
    (belongs H agent_2)
    (belongs I agent_2)
    (belongs J agent_2)

    ; Size ordering (larger x y means x is larger than y)
    (larger J I) (larger J H) (larger J G) (larger J F) (larger J E) (larger J D) (larger J C) (larger J B) (larger J A)
    (larger I H) (larger I G) (larger I F) (larger I E) (larger I D) (larger I C) (larger I B) (larger I A)
    (larger H G) (larger H F) (larger H E) (larger H D) (larger H C) (larger H B) (larger H A)
    (larger G F) (larger G E) (larger G D) (larger G C) (larger G B) (larger G A)
    (larger F E) (larger F D) (larger F C) (larger F B) (larger F A)
    (larger E D) (larger E C) (larger E B) (larger E A)
    (larger D C) (larger D B) (larger D A)
    (larger C B) (larger C A)
    (larger B A)

    ; Initial stacking (top -> bottom on left)
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F G)
    (on G H)
    (on H I)
    (on I J)
    (on J left)

    ; Peg membership of each disk initially
    (at-peg A left)
    (at-peg B left)
    (at-peg C left)
    (at-peg D left)
    (at-peg E left)
    (at-peg F left)
    (at-peg G left)
    (at-peg H left)
    (at-peg I left)
    (at-peg J left)

    ; Clear/top facts
    (clear A)
    (top A)
    (clear middle)
    (clear right)

    ; Step/order control
    (at-step s0)
    (next s0 s1) (next s1 s2) (next s2 s3) (next s3 s4) (next s4 s5) (next s5 s6) (next s6 s7) (next s7 s8) (next s8 s9) (next s9 s10) (next s10 s11) (next s11 s12) (next s12 s13) (next s13 s14) (next s14 s15) (next s15 s16) (next s16 s17) (next s17 s18) (next s18 s19) (next s19 s20) (next s20 s21) (next s21 s22)

    ; Allowed exact move sequence (step, disk, from-peg, to-peg)
    (allowed s0  A left  right)
    (allowed s1  B left  middle)
    (allowed s2  A right middle)
    (allowed s3  C left  right)
    (allowed s4  A middle left)
    (allowed s5  B middle right)
    (allowed s6  A left  right)
    (allowed s7  D left  middle)
    (allowed s8  A right middle)
    (allowed s9  B right left)
    (allowed s10 A middle left)
    (allowed s11 C right middle)
    (allowed s12 A left  right)
    (allowed s13 B left  middle)
    (allowed s14 A right middle)
    (allowed s15 E left  right)
    (allowed s16 A middle left)
    (allowed s17 B middle right)
    (allowed s18 A left  right)
    (allowed s19 C middle left)
    (allowed s20 A right left)
    (allowed s21 B right middle)
  )

  (:goal (and
    ; All moves executed in order
    (at-step s22)

    ; Final configuration:
    ; Left: A on C on F on G on H on I on J on left
    (on J left)
    (on I J)
    (on H I)
    (on G H)
    (on F G)
    (on C F)
    (on A C)
    (at-peg A left)
    (at-peg C left)
    (at-peg F left)
    (at-peg G left)
    (at-peg H left)
    (at-peg I left)
    (at-peg J left)

    ; Middle: B on D on middle
    (on D middle)
    (on B D)
    (at-peg B middle)
    (at-peg D middle)

    ; Right: E on right (and nothing above it)
    (on E right)
    (at-peg E right)

    ; Tops clear to forbid any cap at finish
    (top A) (clear A)
    (top B) (clear B)
    (top E) (clear E)

    ; Heavy block F..J remains on left (safety invariant)
    (at-peg F left)
    (at-peg G left)
    (at-peg H left)
    (at-peg I left)
    (at-peg J left)
  ))
)