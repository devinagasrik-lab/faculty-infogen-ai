import streamlit as st
st.set_page_config(page_title="Faculty InfoGen AI", layout="wide")
st.title("Faculty InfoGen AI")

st.sidebar.title("Navigation")
page = st.sidebar.selectbox("Go to", ["Faculty","Timetable","Subjects & Marks","Research & FDP","AI Reports"])

if page=="Faculty":
    from pages import _01_Faculty as p; p.run()
elif page=="Timetable":
    from pages import _02_Timetable as p; p.run()
elif page=="Subjects & Marks":
    from pages import _03_Subjects_Marks as p; p.run()
elif page=="Research & FDP":
    from pages import _04_Research_FDP as p; p.run()
elif page=="AI Reports":
    from pages import _05_AI_Reports as p; p.run()
