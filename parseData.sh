# Claire Biasco
# May 8, 2020
# UNIX Final Code- parse data to get Billboard Top Charts info

echo
echo "**BILLBOARD TOP CHARTS**"
echo
echo "Here are this week's top ten songs: "

wget -qO- https://www.billboard.com/charts/hot-100 >billboard

sed s/"&#039;"/"'"/g <billboard >billboard2

grep "chart-element__information__song" billboard2 | cut -d">" -f2 | cut -d"<" -f1 | head -10

echo
echo "Want to search the position of a song in the top 100? (y/n): "
read answer
echo

case $answer in
	"y")
		echo "Name of the song to search:"
		read song

		grep "chart-element__information__song" billboard2 |  cut -d">" -f2 | cut -d"<" -f1 >topcharts.txt	
		grep "chart-element__rank__number" billboard2 | cut -d">" -f2 | cut -d"<" -f1 >topcharts2.txt
		paste topcharts2.txt topcharts.txt >FindSongs.txt
	
		echo
		echo "This week $song is number: "	
		grep $song FindSongs.txt | cut -f1
		echo
	;;

	"n")
		break
	;;
	esac

