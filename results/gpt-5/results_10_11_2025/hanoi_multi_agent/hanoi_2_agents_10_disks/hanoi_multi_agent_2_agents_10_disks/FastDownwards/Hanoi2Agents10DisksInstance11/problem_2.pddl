(define (problem Hanoi2Agents10DisksInstance11)
  (:domain hanoi2agents)
  (:objects
    left middle right - peg
    A B C D E F G H I J - disk
    agent_1 agent_2 - agent
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 s17 s18 s19 s20 s21 s22 - step
  )
  (:init
    ; Agent permissions
    (allowed-a1 A) (allowed-a1 B) (allowed-a1 C) (allowed-a1 D) (allowed-a1 E)
    (allowed-a2 F) (allowed-a2 G) (allowed-a2 H) (allowed-a2 I) (allowed-a2 J)

    ; Size ordering: larger X Y => X strictly larger than Y
    (larger J I) (larger J H) (larger J G) (larger J F) (larger J E) (larger J D) (larger J C) (larger J B) (larger J A)
    (larger I H) (larger I G) (larger I F) (larger I E) (larger I D) (larger I C) (larger I B) (larger I A)
    (larger H G) (larger H F) (larger H E) (larger H D) (larger H C) (larger H B) (larger H A)
    (larger G F) (larger G E) (larger G D) (larger G C) (larger G B) (larger G A)
    (larger F E) (larger F D) (larger F C) (larger F B) (larger F A)
    (larger E D) (larger E C) (larger E B) (larger E A)
    (larger D C) (larger D B) (larger D A)
    (larger C B) (larger C A)
    (larger B A)

    ; Initial stacking on left (top -> bottom)
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

    ; All disks initially at peg left
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

    ; Clear/top statuses and empty pegs
    (clear A)
    (top A)
    (clear middle)
    (clear right)

    ; Step control
    (at-step s0)
    (next s0 s1) (next s1 s2) (next s2 s3) (next s3 s4) (next s4 s5) (next s5 s6) (next s6 s7) (next s7 s8) (next s8 s9)
    (next s9 s10) (next s10 s11) (next s11 s12) (next s12 s13) (next s13 s14) (next s14 s15) (next s15 s16) (next s16 s17)
    (next s17 s18) (next s18 s19) (next s19 s20) (next s20 s21) (next s21 s22)

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
    ; Ensure all steps executed in order
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

    ; Right: E on right
    (on E right)
    (at-peg E right)

    ; Top statuses for the three exposed disks
    (top A) (clear A)
    (top B) (clear B)
    (top E) (clear E)
  ))
)