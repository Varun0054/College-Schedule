import '../models/period_model.dart';

Map<String, List<Period>> timetable = {
  "Monday": [
    Period(day: "Monday", time: "9:20-10:20", batch: "T1", subject: "SL-I (DN)", room: "L1 (A103)"),
    Period(day: "Monday", time: "9:20-10:20", batch: "T2", subject: "EL-I-Lab(HCI) (SG)", room: "L2 (A202)"),
    Period(day: "Monday", time: "10:20-11:20", batch: "T3", subject: "CNL (AS)", room: "L3 (A221)"),
    Period(day: "Monday", time: "11:30-12:30", batch: "All", subject: "AI (DN)", room: "A207"),
    Period(day: "Monday", time: "12:30-1:30", batch: "All", subject: "CN (MF)", room: "A207"),
    Period(day: "Monday", time: "2:00-3:00", batch: "All", subject: "CN (MF)", room: "A207"),
    Period(day: "Monday", time: "3:00-4:00", batch: "All", subject: "DBMS (FG)", room: "A207"),
  ],
  "Tuesday": [
    Period(day: "Tuesday", time: "9:20-10:20", batch: "All", subject: "AI (DN)", room: "A207"),
    Period(day: "Tuesday", time: "10:20-11:20", batch: "All", subject: "EL-I (HCI) (SG)", room: "A207"),
    Period(day: "Tuesday", time: "11:30-12:30", batch: "T1", subject: "SL-I(DBMSL) (FG)", room: "L1 (A103)"), // Room L1 assumed as L2 & L3 are occupied
    Period(day: "Tuesday", time: "11:30-12:30", batch: "T2", subject: "CNL (AS)", room: "L3 (A221)"),
    Period(day: "Tuesday", time: "11:30-12:30", batch: "T3", subject: "EL-I(HCI) (SG)", room: "L2 (A202)"),
    Period(day: "Tuesday", time: "12:30-1:30", batch: "T1", subject: "SL-I(DBMSL) (FG)", room: "L1 (A103)"), // Room L1 assumed as L2 & L3 are occupied
    Period(day: "Tuesday", time: "12:30-1:30", batch: "T2", subject: "CNL (AS)", room: "L3 (A221)"),
    Period(day: "Tuesday", time: "12:30-1:30", batch: "T3", subject: "EL-I(HCI) (SG)", room: "L2 (A202)"),
    Period(day: "Tuesday", time: "2:00-3:00", batch: "All", subject: "CN (MF)", room: "A207"),
    Period(day: "Tuesday", time: "3:00-4:00", batch: "All", subject: "STC (AS)", room: "A207"),
  ],
  "Wednesday": [
    Period(day: "Wednesday", time: "9:20-10:20", batch: "All", subject: "EL-I (HCI) (SG)", room: "A207"),
    Period(day: "Wednesday", time: "10:20-11:20", batch: "All", subject: "AI (DN)", room: "A207"),
    Period(day: "Wednesday", time: "11:30-12:30", batch: "All", subject: "AC-5 (DN)", room: "A207"),
    Period(day: "Wednesday", time: "12:30-1:30", batch: "All", subject: "WT (SB)", room: "A207"),
    Period(day: "Wednesday", time: "2:00-3:00", batch: "T1", subject: "CNL (AS)", room: "L2 (A202)"),
    Period(day: "Wednesday", time: "2:00-3:00", batch: "T2", subject: "SL-I (DN)", room: "L1 (A103)"),
    Period(day: "Wednesday", time: "3:00-4:00", batch: "T3", subject: "SL-I(DBMSL) (FG)", room: "L3 (A221)"),
  ],
  "Thursday": [
    Period(day: "Thursday", time: "9:20-10:20", batch: "All", subject: "WT (SB)", room: "A207"),
    Period(day: "Thursday", time: "10:20-11:20", batch: "All", subject: "DBMS (FG)", room: "A207"),
    Period(day: "Thursday", time: "11:30-12:30", batch: "T1", subject: "EL-I-Lab(HCI) (SG)", room: "L2 (A202)"),
    Period(day: "Thursday", time: "11:30-12:30", batch: "T2", subject: "SL-I (DN)", room: "L1 (A103)"),
    Period(day: "Thursday", time: "11:30-12:30", batch: "T3", subject: "SL-I (FG)", room: "L3 (A221)"),
    Period(day: "Thursday", time: "12:30-1:30", batch: "T1", subject: "EL-I-Lab(HCI) (SG)", room: "L2 (A202)"),
    Period(day: "Thursday", time: "12:30-1:30", batch: "T2", subject: "SL-I (DN)", room: "L1 (A103)"),
    Period(day: "Thursday", time: "12:30-1:30", batch: "T3", subject: "SL-I (FG)", room: "L3 (A221)"),
    Period(day: "Thursday", time: "2:00-3:00", batch: "All", subject: "TG MEETING", room: "A207"),
    Period(day: "Thursday", time: "3:00-4:00", batch: "All", subject: "Remedial Classes", room: "A207"),
  ],
  "Friday": [
    Period(day: "Friday", time: "9:20-10:20", batch: "All", subject: "WT (SB)", room: "A207"),
    Period(day: "Friday", time: "10:20-11:20", batch: "All", subject: "DBMS (FG)", room: "A207"),
    Period(day: "Friday", time: "11:30-12:30", batch: "All", subject: "ES (AC)", room: "A207"),
    Period(day: "Friday", time: "12:30-1:30", batch: "All", subject: "EL-I (HCI) (SG)", room: "A207"),
    Period(day: "Friday", time: "2:00-3:00", batch: "All", subject: "Library", room: "-"),
  ],
  "Saturday": [
    Period(day: "Saturday", time: "9:20-11:20", batch: "All", subject: "Pre-Placement Activity/VAP Session/Workshop/Sem nar", room: "na"),
    Period(day: "Saturday", time: "11:30-1:30", batch: "All", subject: "Pre-Placement Activity/VAP Session/Workshop/Sem nar", room: "na"),
    Period(day: "Saturday", time: "2:00-4:00", batch: "All", subject: "Pre-Placement Activity/VAP Session/Workshop/Sem nar", room: "na"),
  ],
};